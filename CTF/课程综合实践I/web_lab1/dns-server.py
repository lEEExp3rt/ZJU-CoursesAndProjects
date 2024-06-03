import dns.message
import dns.resolver
import dns.query
import socket
from dnslib import DNSRecord, QTYPE

def handle_dns_request(data): #用于处理DNS请求
    request = DNSRecord.parse(data)
    qname = str(request.q.qname)
    qtype = request.q.qtype

    # 查询真实的 DNS 服务器
    resolver = dns.resolver.Resolver()
    response = resolver.query(qname, qtype)

    # 构建 DNS 响应
    dns_response = DNSRecord(DNSHeader(id=request.header.id, qr=1, aa=1, ra=1), q=request.q)
    for answer in response:
        rrtype = QTYPE[answer.rdtype]
        dns_response.add_answer(RR(qname, getattr(QTYPE, rrtype), rdata=RDMAP[rrtype](answer.to_text())))

    return dns_response.pack()

# DNS 服务器地址和端口
server_address = '127.0.0.1'
server_port = 53

# 创建 UDP socket 并监听指定地址和端口
sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind((server_address, server_port))

print(f"DNS server is running on {server_address}:{server_port}...")

while True:
    data, addr = sock.recvfrom(1024)
    
    # 处理 DNS 请求
    response_data = handle_dns_request(data)
    
    # 发送 DNS 响应
    sock.sendto(response_data, addr)
