# Docker-Freeling

Freeling can run in different modes: server mode, and standalone mode. You can create application that consumes services from freeling running standalone or as a server (check references for ways of execute shell commands from python)  

## Standalone mode
As a standalone mode you run the analyzer one time per input file

### Create the docker image

```
docker build -t freeling .
```

### Create an input file

```
echo "El gato come pescado. Pero a Don Jaime no le gustan los gatos." > input.txt
```

### Run the container

```
docker run -i --rm  freeling analyze -f en.cfg < input.txt > output.txt
```

### Check the output

```
cat ouput.txt
El el NN 1
gato gato NN 0.888907
come come VBN 0.186036
pescado pescado NN 0.917823
. . Fp 1

Pero_a_Don_Jaime pero_a_don_jaime NP 1
no no DT 0.99987
le le JJ 0.440988
gustan gustan JJ 0.73283
los los NNS 1
gatos gatos NNS 0.601624
. . Fp 1
```

## Server mode
Pending...

### References
https://github.com/TALP-UPC/FreeLing/tree/master/APIs/docker  
https://talp-upc.gitbooks.io/freeling-user-manual/content/analyzer.html  
https://github.com/ICESI-Training/microservices2016b
