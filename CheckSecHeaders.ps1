add-type @"    
	using System.Net;    
	using System.Security.Cryptography.X509Certificates;    
	public class TrustAllCertsPolicy : ICertificatePolicy {        
		public bool CheckValidationResult(            
			ServicePoint srvPoint, X509Certificate certificate,            
			WebRequest request, int certificateProblem) {            
			return true;        
		}    
	}
"@
[System.Net.ServicePointManager]::CertificatePolicy = New-Object TrustAllCertsPolicy
$headers = Invoke-WebRequest $args[0] -Method Head

if($headers.Headers.ContainsKey("Strict-Transport-Security"))
{
Write-Host "[+] Contains Strict-Transport-Security" -ForegroundColor Green
}else{
Write-Host "[-] No Strict-Transport-Security" -ForegroundColor Red
}

if($headers.Headers.ContainsKey("X-Frame-Options"))
{
Write-Host "[+] Contains X-Frame-Options" -ForegroundColor Green
}else{
Write-Host "[-] No X-Frame-Options" -ForegroundColor Red
}

if($headers.Headers.ContainsKey("X-Content-Type-Options"))
{
Write-Host "[+] Contains X-Content-Type-Options" -ForegroundColor Green
}else{
Write-Host "[-] No X-Content-Type-Options" -ForegroundColor Red
}

if($headers.Headers.ContainsKey("Content-Security-Policy"))
{
Write-Host "[+] Contains Content-Security-Policy" -ForegroundColor Green
}else{
Write-Host "[-] No Content-Security-Policy" -ForegroundColor Red
}

if($headers.Headers.ContainsKey("Referrer-Policy"))
{
Write-Host "[+] Contains Referrer-Policy" -ForegroundColor Green
}else{
Write-Host "[-] No Referrer-Policy" -ForegroundColor Red
}
if($headers.Headers.ContainsKey("Cross-Origin-Embedder-Policy"))
{
Write-Host "[+] Contains Cross-Origin-Embedder-Policy" -ForegroundColor Green
}else{
Write-Host "[-] No Cross-Origin-Embedder-Policy" -ForegroundColor Red
}
if($headers.Headers.ContainsKey("Cross-Origin-Opener-Policy"))
{
Write-Host "[+] Contains Cross-Origin-Opener-Policy" -ForegroundColor Green
}else{
Write-Host "[-] No Cross-Origin-Opener-Policy" -ForegroundColor Red
}
if($headers.Headers.ContainsKey("Cross-Origin-Resource-Policy"))
{
Write-Host "[+] Contains Cross-Origin-Resource-Policy" -ForegroundColor Green
}else{
Write-Host "[-] No Cross-Origin-Resource-Policy" -ForegroundColor Red
}