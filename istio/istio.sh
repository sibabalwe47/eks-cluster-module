# `virtual services`

# kubectl get virtualservices
# kubectl get destinationrules

# # See more at https://istio.io/docs/reference/config/networking/gateway/


# Gateway

# apiVersion: networking.istio.io/v1alpha3
# kind: Gateway
# metadata:
#   name: ingress-gateway-configuration
# spec:
#   selector:
#     istio: ingressgateway
#   servers:
#   - port:
#       number: 80
#       name: http
#       protocol: HTTP
#     hosts:
#     - "*"

# Destination Rule

# apiVersion: networking.istio.io/v1alpha3
# kind: DestinationRule
# metadata:
#   name: weighted-routing-dr
#   namespace: default
# spec:
#   host: fleetman-staff-service.default.svc.cluster.local
#   subsets:
#   - name: safe
#     labels:
#       version: safe

# Virtual service

# apiVersion: networking.istio.io/v1alpha3
# kind: VirtualService
# metadata:
#   name: ingress-virtual-service
#   namespace: default
# spec:
#   hosts:
#   - fleetman-staff-service.default.svc.cluster.local
#   - "*"
#   gateways:
#   - ingress-gateway-configuration
#   http:
#   - route:
#     - destination:
#         host: fleetman-staff-service.default.svc.cluster.local
#         subset: safe
