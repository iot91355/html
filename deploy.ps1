param(
    [string]$Image,
    [string]$Container,
    [int]$Port
)

# Stop & remove old container if exists
docker rm -f $Container 2>$null

# Pull latest image
docker pull $Image

# Run new container
docker run -d --name $Container -p $Port:80 $Image

# Test container
try {
    Invoke-WebRequest http://localhost:$Port -UseBasicParsing
    Write-Host "Deployment successful!"
} catch {
    Write-Host "Deployment failed!"
    exit 1
}
