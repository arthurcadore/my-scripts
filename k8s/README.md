# Kubernetes setup configuration scripts 

## Init Master: 

- **(Recommended) If you have plans to upgrade this single control-plane kubeadm cluster to high availability you should specify the `--control-plane-endpoint` to set the shared endpoint for all control-plane nodes. Such an endpoint can be either a DNS name or an IP address of a load-balancer.** 

- **Choose a Pod network add-on, and verify whether it requires any arguments to be passed to kubeadm init. Depending on which third-party provider you choose, you might need to set the `--pod-network-cidr` to a provider-specific value. See Installing a Pod network add-on. Also is important to add `--service-cidr` to specify the range of IP addresses for the service VIPs.**

- **(Optional) kubeadm tries to detect the container runtime by using a list of well known endpoints. To use different container runtime or if there are more than one installed on the provisioned node, specify the `--cri-socket` argument to kubeadm. See Installing a runtime.**

Example command: 

```bash
kubeadm reset
kubeadm init --v=5 --control-plane-endpoint=<FQDN> --pod-network-cidr=<PREFIX>/<CIDR> --service-cidr=<PREFIX>/<CIDR>
```
