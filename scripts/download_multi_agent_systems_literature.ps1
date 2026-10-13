$ErrorActionPreference = 'Continue'

$outputDirectory = Join-Path $PSScriptRoot '..\Multi-agent systems相关文献'
$outputDirectory = [System.IO.Path]::GetFullPath($outputDirectory)
New-Item -ItemType Directory -Path $outputDirectory -Force | Out-Null

$papers = @(
  [pscustomobject]@{ Title = 'A Modal Logic for Coalitional Power in Games'; Urls = @('https://content.openalex.org/works/W2109058602.pdf', 'https://academic.oup.com/logcom/article-pdf/12/1/149/3657514/120149.pdf', 'https://citeseerx.ist.psu.edu/document?doi=2024da258fd394803bbf3667b422ce78d792a11f&repid=rep1&type=pdf') },
  [pscustomobject]@{ Title = 'Alternating-Time Temporal Logic'; Urls = @('https://www.cis.upenn.edu/~alur/Jacm02.pdf') },
  [pscustomobject]@{ Title = 'Cooperation, Knowledge, and Time：Alternating-Time Temporal Epistemic Logic and Its Applications'; Urls = @('https://www.cs.ox.ac.uk/people/michael.wooldridge/pubs/studia2003.pdf') },
  [pscustomobject]@{ Title = 'Strategy Logic'; Urls = @('https://research-explorer.ista.ac.at/download/3861/4911/IST-2012-56-v1%2B1_Strategy_logic.pdf') },
  [pscustomobject]@{ Title = 'MCMAS：A Model Checker for the Verification of Multi-Agent Systems'; Urls = @('https://link.springer.com/content/pdf/10.1007/978-3-642-02658-4_55.pdf', 'https://scispace.com/pdf/mcmas-a-model-checker-for-the-verification-of-multi-agent-11wqnfwtma.pdf') },
  [pscustomobject]@{ Title = 'Model-Checking ATL under Imperfect Information and Perfect Recall Semantics Is Undecidable'; Urls = @('https://arxiv.org/pdf/1102.4225') },
  [pscustomobject]@{ Title = 'An Abstraction-Refinement Framework for Multi-Agent Systems'; Urls = @('https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=1695604', 'https://doi.org/10.1109/LICS.2006.10') },
  [pscustomobject]@{ Title = 'An Abstraction Technique for the Verification of Multi-Agent Systems Against ATL Specifications'; Urls = @('https://www.doc.ic.ac.uk/~alessio/papers/14/KR14-LM-2.pdf', 'https://ii.uni.wroc.pl/~jmi/papers/kr14-atl.pdf') },
  [pscustomobject]@{ Title = 'Agent-Based Refinement for Predicate Abstraction of Multi-Agent Systems'; Urls = @('https://www.doc.ic.ac.uk/~fbelard/Documents/ecai2016b.pdf') },
  [pscustomobject]@{ Title = 'An Abstraction-Refinement Framework for Verifying Strategic Properties in Multi-Agent Systems with Imperfect Information'; Urls = @('https://vadimmalvone.github.io/papers/AIJ23.pdf') },
  [pscustomobject]@{ Title = 'Alternating-time logic with imperfect recall'; Urls = @('https://content.openalex.org/works/W1999134680.pdf', 'https://www.sciencedirect.com/science/article/pii/S1571066105826040/pdf', 'https://www.sciencedirect.com/science/article/pii/S1571066105826040/pdfft?isDTMRedir=true&download=true') },
  [pscustomobject]@{ Title = 'Reasoning About Strategies On the Model-Checking Problem'; Urls = @('https://arxiv.org/pdf/1112.6275', 'https://dl.acm.org/doi/pdf/10.1145/2631917') },
  [pscustomobject]@{ Title = 'Symbolic Model Checking Epistemic Strategy Logic'; Urls = @('https://intranet.csc.liv.ac.uk/~xiaowei/papers/obs_alg.pdf', 'https://citeseerx.ist.psu.edu/document?doi=4a532ba96bf44d32812cc2a15ffaa15a2dc6203b&repid=rep1&type=pdf') },
  [pscustomobject]@{ Title = 'Verifying and Synthesising Multi-Agent Systems against One-Goal Strategy Logic Specifications'; Urls = @('https://www.doc.ic.ac.uk/~alessio/papers/15/AAAI15-CLM.pdf', 'https://ojs.aaai.org/index.php/AAAI/article/download/9444/9303') },
  [pscustomobject]@{ Title = 'Verification of Multi-Agent Systems via Predicate Abstraction against ATLK Specifications'; Urls = @('https://www.ifaamas.org/Proceedings/aamas2016/pdfs/p662.pdf', 'https://ii.uni.wroc.pl/~jmi/papers/aamas16.pdf') },
  [pscustomobject]@{ Title = 'Counterexample-Guided Abstraction Refinement'; Urls = @('https://www.cs.cmu.edu/~emc/papers/Conference%20Papers/Counterexample-guided%20Abstraction%20Refinement.pdf') },
  [pscustomobject]@{ Title = 'Scalable Verification of Strategy Logic through Three-Valued Abstraction'; Urls = @('https://www.ijcai.org/proceedings/2023/0006.pdf') },
  [pscustomobject]@{ Title = 'Abstraction of Situation Calculus Concurrent Game Structures'; Urls = @('https://ojs.aaai.org/index.php/AAAI/article/download/28933/29774') }
)

function Test-PdfFile {
  param([Parameter(Mandatory = $true)][string]$Path)

  if (-not (Test-Path -LiteralPath $Path -PathType Leaf)) {
    return $false
  }
  if ((Get-Item -LiteralPath $Path).Length -lt 10240) {
    return $false
  }
  $stream = [System.IO.File]::OpenRead($Path)
  try {
    $buffer = New-Object byte[] 5
    if ($stream.Read($buffer, 0, 5) -ne 5) {
      return $false
    }
    return ([System.Text.Encoding]::ASCII.GetString($buffer) -eq '%PDF-')
  }
  finally {
    $stream.Dispose()
  }
}

$results = foreach ($paper in $papers) {
  $targetPath = Join-Path $outputDirectory ($paper.Title + '.pdf')
  $downloadedFrom = $null

  if (Test-PdfFile -Path $targetPath) {
    $downloadedFrom = 'existing-valid-file'
  }
  else {
    foreach ($url in $paper.Urls) {
      $temporaryPath = $targetPath + '.part'
      Remove-Item -LiteralPath $temporaryPath -Force -ErrorAction SilentlyContinue
      & curl.exe -L --fail --retry 2 --connect-timeout 20 --max-time 180 --silent --show-error --user-agent 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36' --output $temporaryPath $url
      if (($LASTEXITCODE -eq 0) -and (Test-PdfFile -Path $temporaryPath)) {
        Move-Item -LiteralPath $temporaryPath -Destination $targetPath -Force
        $downloadedFrom = $url
        break
      }
      Remove-Item -LiteralPath $temporaryPath -Force -ErrorAction SilentlyContinue
    }
  }

  $valid = Test-PdfFile -Path $targetPath
  $size = if ($valid) { (Get-Item -LiteralPath $targetPath).Length } else { 0 }
  [pscustomobject]@{
    Title = $paper.Title
    ValidPdf = $valid
    Bytes = $size
    Source = $downloadedFrom
  }
}

$results | Format-Table -AutoSize -Wrap
$failed = @($results | Where-Object { -not $_.ValidPdf })
Write-Output ("VALID={0}; FAILED={1}; DIRECTORY={2}" -f ($results.Count - $failed.Count), $failed.Count, $outputDirectory)
if ($failed.Count -gt 0) {
  Write-Output 'FAILED TITLES:'
  $failed.Title
  exit 1
}
