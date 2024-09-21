Collaboration
=============

## 1. Principal
### 1.1 Working Process
* Simple, easy to use
* Focus on collaboration (NOT the process)
### 1.2 Code + Solution
* Streamlining, remove unnecessary parts
* Clean code, follow the convention
* Maintainability
* Extendability

## 2. Objective
* DevOps culture
* _Everything_ as Code
* Immutable Infrastructure

## 3. Work Agreements
* **Code**: PR, Review
* **Research**: Docs, Demo, Peer-worker
* **Documentation**: Less words, More pictures, Has references
* **Retrospective**:
  * Tần suất sử dụng
  * Mức độ hài lòng
  * Vấn đề kỹ thuật

## 4. Solution process
### 4.1 Motivation
* Để thuận tiện trong việc thảo luận, trao đổi
* Để mọi người trong team đều hiểu rõ cách làm việc, lộ trình để đưa 1 solution đến với end-user.

### 4.1 Senarios
Các tasks có thể xuất phát từ nhiều nguồn với nhiều lý do khác nhau, cho nên Solution process phải đáp ứng được các senarios dưới đây:
1. Từ yêu cầu của end-user  
    Khi solution hiện tại chưa đáp ứng được nhu cầu end-user, và có request về new requirements.
2. Từ nội bộ team  
    Khi giải pháp hiện tại còn khuyết điểm và bạn sẽ tìm cách cải tiến nó.
3. Khi muốn học hỏi cái mới  
    Khi bạn nghe một cái tên mới, giải pháp mới mà chưa từng có kinh nghiệm trước đây.
    Và bạn có nhu cầu tìm hiểu để mở rộng kiến thức cũng như đánh giá khả năng có thể áp dụng.

### 4.1 Process
<img src="/kubernetes/res/solution-process.svg" alt="solution-process" width="50%">

0. Identify Problem  
    Xác định vấn đề mình cần gải quyết, phạm vi của vấn đề, đánh giá rủi ro & chi phí (time/money) cho phép.
1. Research Knowledge  
    Tìm hiểu các kiến thức để giải quyết vấn đề
2. Proof of concept (PoC)  
    Trong quá trình tìm hiểu cần có PoC demo, cũng có thể chọn 1 project thực tế làm pilot.
3. Planing  
    Sau khi đã finally solution, cần lên kế hoạch triển khai, bao gồm việc
    * Viết tài liệu User guide
    * Thông báo thay đổi cho các bên liên quan
4. Apply to Production
5. Verify and Feedback

## 5. JIRA
### 5.1 Workflow
![workflow](/kubernetes/res/workflow.png)

### 5.2 Issues
1. Issue types:  
Quan hệ của các issue type trong JIRA như hình dưới. Một issue có thể convert sang type khác, tuy nhiên cần hạn chế việc này.

![jira-issue-types](/kubernetes/res/jira-issue-types.png)


2. Gán label cho các issues.  
Các common labels là:

| Name                | Areas                                               |
|---------------------|-----------------------------------------------------|
| `state/pending`     | Issue đang ở `In Progress` vì bất kỳ lý do gì mà không thể tiếp tục. Chuyển issue về `TODO` rồi gán label `state/pending` |
| `state/review`      | Issue ở `In Progress`, cần có người vào review      |
| `state/fails`       | Vì bất kỳ vấn đề gì dẫn tới task không hoàn thành, chuyển issue sang `Done` rồi gán label `state/fails` |

3. Components

| Name               | Areas                                               |
|--------------------|-----------------------------------------------------|
| `networking`       |                                                     |
| `storage`          |                                                     |
| `services`         | Service, Ingress, LoadBalancer                      |
| `operator`         | Kubernetes CRD & Controller                         |
| `security`         | ResourceQuota, NetworkPolicy, PodSecurityPolicy,... |
| `observation`      | Metrics, Logs, Trace                                |
| `pipeline`         | CI/CD, Development process                          |
| `docs`             | All about documentations                            |
| `testing`          | Testing & Chaos engineering                         |
| `bigdata`          | BigData related tasks                               |
| `machine-learning` | AI/ML/DL related tasks                              |

4. Description:  
Trong phần `Description` yêu cầu có 2 (ít nhất) mục sau:

* Mô tả:  
Viết đặc tả ngắn gọn về issue, nếu là user story có thể sử dụng cấu trúc sau:
```
As a <role>
I want to <do something>
In order to <purpose>
```

* Definition of Done (DoD):  
Gạch đầu dòng các tiêu chí cần đạt được để hoàn thành mục tiêu.

***Ví dụ***:

![User Story Example](/kubernetes/res/user_story_example.png)
