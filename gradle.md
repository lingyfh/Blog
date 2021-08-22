## build cache
* instal jfrog artifactory: docker pull releases-docker.jfrog.io/jfrog/artifactory-jcr:latest
* start docker: docker run -d -p 8081:8081 -p 8082:8082 releases-docker.jfrog.io/jfrog/artifactory-jcr
* FAQ1: Sending HTTP error code 503: In order to use Artifactory you must accept the EULA first
-> curl -XPOST -vu user:password http://localhost:8082/artifactory/ui/jcr/eula/accept
