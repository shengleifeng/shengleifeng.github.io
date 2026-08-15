$files = @(
  "fwi-coupled-source.json",
  "adaptive-trace-gcv.json",
  "impulse-l1-tv.json",
  "joint-multimodal.json",
  "viscoelastic-spectrum.json",
  "rpca-illumination.json",
  "gmm-moment.json",
  "cv-hyperbolic.json",
  "vector-tomography-helmholtz.json",
  "irls-curvature-collapse.json"
)
foreach ($f in $files) {
  try {
    $content = Get-Content $f -Raw -Encoding UTF8
    $json = $content | ConvertFrom-Json
    $bodyCount = $json.body.Count
    $mathCount = ($json.body | Where-Object { $_.type -eq 'math' }).Count
    $pCount = ($json.body | Where-Object { $_.type -eq 'p' }).Count
    Write-Host ("OK {0}: body={1} p={2} math={3} | id={4}" -f $f, $bodyCount, $pCount, $mathCount, $json.id)
  } catch {
    Write-Host ("FAIL {0}: {1}" -f $f, $_.Exception.Message)
  }
}
