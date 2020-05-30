# kubedu
Small shell script that displays all your PVC stats (used storage, available storage..) 
![](demo.gif)
### Setup
```bash
curl https://raw.githubusercontent.com/itninja-hue/kubedu/master/kubedu.sh --output kubedu.sh
chmod +x kubedu.sh
```
### Usage
```bash 
./kubedu.sh
NAMESPACE                       ClaimeName                                                                                              USAGE   MOUNTPATH                      CAPACITY
log-monitoring                  elasticsearch-data-elasticsearch-es-default-0                                                           7.4G    /usr/share/elasticsearch/data  10Gi
prod-eventstore                 prod-eventstore-pvc                                                                                     3.3G    /var/lib/eventstore            20Gi
prod-microservice-cron-rating   mysql-pv-claim                                                                                          211M    /var/lib/mysql                 20Gi
prod-microservice-geocaching    redis-master-pvc                                                                                        89M     /bitnami/redis/data            1Gi
prod-microservice-notification  mysql-pv-claim                                                                                          247M    /var/lib/mysql                 20Gi
prod-microservice-notification  microservice-templates-pvc                                                                              364.0K  /app/templates                 500Mi
prod-microservice-notification  microservice-templates-pvc                                                                              364.0K  /app/templates                 500Mi
prod-microservice-rating        mysql-pv-claim                                                                                          212M    /var/lib/mysql                 5Gi
promethus-monitoring            prometheus-promethus-prometheus-opera-prometheus-db-prometheus-promethus-prometheus-opera-prometheus-0  2.6G    /prometheus                    50Gi

```
# podschecker
podschecker is a simple script thats check your pods health on your terminal, it can send x11 notifications
![](PodHealth.gif)

### Setup

```bash
curl https://raw.githubusercontent.com/itninja-hue/kubedu/master/podschecker.sh --output podschecker.sh
chmod +x podschecker.sh
```
### Usage

```bash 
➜   ./notify_unhealthy_pods.sh

Sit Down and Wait  😂 :

busybox ... OK!
nginx ... OK!
nginx22 ... OK!
nginxerr ... Oh Shit !

STATS:

+---------------+---------------+
|Healthy Pods   |Unhealthy Pods |
+---------------+---------------+
|1              |3              |
+---------------+---------------+

```