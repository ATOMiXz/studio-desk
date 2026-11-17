# Tiny static server for previewing Studio Desk (images need http://, not a file snapshot).
param([string]$Root = '.', [int]$Port = 8452)
$Root = (Resolve-Path $Root).Path.TrimEnd('\') + '\'
$types = @{ '.html' = 'text/html; charset=utf-8'; '.png' = 'image/png'; '.jpg' = 'image/jpeg'; '.webp' = 'image/webp'; '.svg' = 'image/svg+xml'; '.css' = 'text/css'; '.js' = 'text/javascript'; '.json' = 'application/json'; '.mp4' = 'video/mp4'; '.webm' = 'video/webm' }
$l = New-Object System.Net.HttpListener
$l.Prefixes.Add("http://localhost:$Port/")
$l.Start()
Write-Host "Studio Desk running at http://localhost:$Port/"
while ($l.IsListening) {
  $c = $l.GetContext(); $r = $c.Response
  try {
    $rel = [Uri]::UnescapeDataString($c.Request.Url.AbsolutePath.TrimStart('/'))
    if (-not $rel) { $rel = 'index.html' }
    $full = [IO.Path]::GetFullPath((Join-Path $Root $rel))
    if ($full.StartsWith($Root) -and (Test-Path $full -PathType Leaf)) {
      $b = [IO.File]::ReadAllBytes($full)
      $ext = [IO.Path]::GetExtension($full).ToLower()
      if ($types.ContainsKey($ext)) { $r.ContentType = $types[$ext] }
      $r.Headers.Add('Cache-Control', 'no-store')
      $r.Headers.Add('Accept-Ranges', 'bytes')
      # Video needs byte ranges so the browser can loop and seek.
      $range = $c.Request.Headers['Range']
      if ($range -match 'bytes=(\d+)-(\d*)') {
        $s = [int64]$matches[1]; $e = if ($matches[2]) { [int64]$matches[2] } else { $b.Length - 1 }
        $e = [Math]::Min($e, $b.Length - 1)
        $r.StatusCode = 206; $r.Headers.Add('Content-Range', "bytes $s-$e/$($b.Length)")
        $r.ContentLength64 = $e - $s + 1; $r.OutputStream.Write($b, $s, $e - $s + 1)
      } else { $r.ContentLength64 = $b.Length; $r.OutputStream.Write($b, 0, $b.Length) }
    } else { $r.StatusCode = 404 }
  } catch {} finally { try { $r.Close() } catch {} }
}
