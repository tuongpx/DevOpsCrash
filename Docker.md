Instruction phổ biến trong Dockerfile:

FROM:
    - Được sử dụng để build image từ một image được chỉ định
    - Là Instruction khai báo đầu tiên trong Dockerfile
    - Trong một file Dockerfile có thể có nhiều FROM Instruction để tạo nhiều image
    - Những Image phía sau có để dependency với Image trước đó
Syntax: FROM [--platform = <platform>] <image>[:<tag>] [AS<name>]
ARG:
    - Instruction duy nhất được đứng trước FROM
    - Có thể khai báo nhiều ARG trong một Dockerfile
    - Dùng để tạo Argument trong quá trình build Image
Syntax: ARG <key> = <value>
==> Instruction này chỉ có tác dụng khi build image , sau khi build image xong thì instruction này không còn tác dụng
ENV:
    - Dùng để khai báo biến môi trường khi build image , và sử dụng trong Container
    - Có thể khai báo nhiều ENV trong một Dockerfile
    - Sử dụng trong khi Container Running
Syntax: ENV <key> = <value>
METADATA: LABEL, MAINTAINER
    - LABEL : Dùng để định nghĩa thêm các thông tin Metadata cho Container
    - MAINTAINER: Sử dụng để thêm thông tin Author cho Container, nhưng Docker đã Predecated, và thay thế bở LABEL vì LABEL sẽ flexible hơn MAINTAINER
    - Ví dụ: Version, Author
Syntax: LABEL <key> = <value> <key>=<value> ...

Những Instruction dùng để Execute Command:

RUN:
    Được sử dụng để chạy các câu lệnh được khai báo trong quá trình build Image
CMD:
    Giống như RUN để thực thi các câu lệnh khai báo. Instruction này sẽ Set câu lệnh thực thi mặc định cho Container, câu lệnh này chỉ được thực thi một lần duy nhất khi Run Container.
    Khi run CMD và truyền thêm parameter thì CMD sẽ bị ignore và chỉ chạy param được truyền vào phía sau
ENTRYPOINT:
    Giống như CMD để thực thi các câu lệnh khai báo, và sẽ chỉ được thực thi một lần duy nhất khi Run Container.    
    Khi thực thi ENTRYPOINT kèm theo parameters phía sau thì sẽ thực thi cả ENTRYPOINT và parameter, lấy parameter phía sau làm parameter cho chính câu lệnh entrypoint này luôn

Sự khác nhau giữa CMD và ENTRYPOINT
CMD:
    Khi run Container mà không truyền Parameters ở command thì CMD sẽ được thực thi, ngược lại nếu có parameters thì CMD sẽ bị ignored
ENTRYPOINT:
    Khi run Container mà không có Parameters ở command thì ENTRYPOINT sẽ được thực thi, ngược lại nếu có Parameters thì ENTRYPOINT sẽ lấy Parameterrs làm Value cho cậu lệnh ENTRYPOINT.

Những Instruction dùng để copy thư mục:
ADD:
    Được sử dụng để COPY file hoặc thư mục từ Source đến Destination của Container.
COPY:
    Giống như ADD để COPY file hoặc thư mục từ Source đến Destination của Container.

EXPOSE:
    - Dùng để chỉ định PORT được mở từ Container
    - Có thể chỉ định mở cổng theo TCP hoặc UDP
    - Mặc định sẽ là TCP
Syntax: EXPOSE <port>/<protocol>

WORKDIR:
    - Được sử dụng để di chuyển tới thư mục
    - Có thể khai báo nhiều WORKDIR trong Dockerfile
    - Thường khai báo kèm với những Instruction như: RUN, COPY ...
Syntax: WORKDIR <path>

USER:
    - Sử dụng để set USER mặc định trong quá trình build Image
    - Những Instruction như RUN sẽ sử dụng USER để cấp quyền execute command
    - Sử dụng USER cự kỳ quan trọng trong vấn đề SECURE
Syntax: USER <name>

Docker Network: Mặc định sau khi cài đặt xong, Docker sẽ tạo ra 3 card mạng mặc định là : HOST-BRIDGE-
HOST:
    - Khi khởi tạo sẽ sử dụng Network của Host Machine bằng cách: Container sẽ mở một hoặc nhiều port và Host Machine sẽ map port từ Host Machine vào port của Container, từ đó bên ngoài có thể gọi vào Container thông qua network của Host Machine.
BRIDGE:
    - Docker sẽ có một module được gọi là Bridge để gom tất cả các container trong cùng một Bridge có thể giao tiếp với được với nhau. Docker sẽ tạo những quyền hạn chế để tránh Container khác Bridge giao tiếp với nhau.
    - Nên sử dụng BRIDGE khi nào:
        + Khi muốn group một số container sử dụng chung Network với nhau, và chỉ những Container cùng chung Network có thể giao tiếp được với nhau
        + Và phạm vi hoạt động của BRIDGE chỉ sử dụng trong cùng một Docker Host
OVERLAY:
    - Overlay giúp cho các Container khác Docker Host có thể giao tiếp được với nhau.

VOLUME
M428H-2AJE3-M80Q3-099UK-A4U10  