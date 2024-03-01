# what is this chapter about
threads conceptually
benefits and challenges of multi-threaded programs
thread pools, fork-join, grand central dispatch
thread APIs in java, windows, and unix

---

# 2024-02-27
>	what is a thread, what does threading mean, what is a process
>	why are threads useful
>	what are the main challenges of multi-threaded programming

###	what is the "data section" of a process

the data section contains non-zero initialized global and static variables of a process, as well as it's file descriptor table.

uninitialized global and static variables are automatically initialized to zero when the program starts, and for memory efficiency are not unnecessarily included in the .data section.

###	what is the "text (code) section" of a process

the read-only instructions of the program (loaded in memory to be executed by the CPU).

for a compiled program, the text section would be the binary encoded assembly language instructions of the program. for an interpreted program, the text section would be the literal high-level instructions of the program which would get passed to the interpreter to execute in sequence.

###	as a unit of measure, what is "cpu utilization" 

high cpu utilization means a processor is near or at it's maximum capacity for executing instructions, potentially leading to tasks slowing down.

this is in contrast to low cpu utilization, which suggests the processor has idle resources which could be utilized for additional tasks.

###	what is a "thread"	

a thread represents a sequence of instructions to be executed within a process; and is implemented as a struct comprising of a unique id, pc, register set, and stack.

one process can have several threads being executed asynchronously; and each thread shares it's process's heap, code, and data sections (dynamically allocated memory, instructions, and non-zero initialized global & static variables).

###	what are the 4 benefits of multi-threading

all of the benefits of multiprocessing (increased responsiveness and scalability), but without the unnecessary code and data section duplication (increased resource efficiency and resource sharing).

on the test, it will likely be given as 

1.	"responsiveness"
2.	"scalability"
3.	"economy"
4.	"resource sharing"

---

# 2024-02-29
looked into kernel and user threads. learned what virtual memory is, and that there is "user space" and "kernel space". sort of got a feel for kernel vs. user threads, have a high level idea of the primary differences. reading

>	what are kernel threads
>	what are user threads
>	what are the core differences between kernel and user threads



>	what are user threads

The key differences between kernel threads and user threads are primarily based on their management, execution context, and capabilities:

left off

1. **Management and Scheduling**:
   - **Kernel Threads** are managed and scheduled by the operating system kernel. This means the kernel directly controls their creation, execution, and termination. Kernel threads can take advantage of multiple processors since the kernel has knowledge of all threads and can schedule them across CPUs[3].
   - **User Threads** are managed by a user-level library (e.g., POSIX threads for C/C++ or Java threads in the JVM), not the kernel. The kernel is unaware of user threads and sees the entire process as a single execution entity. Scheduling of user threads is done in user space, allowing for custom scheduling algorithms[3].

2. **Execution Context**:
   - **Kernel Threads** execute in kernel space, allowing them direct access to kernel functions and resources. This is essential for performing system-level tasks[3].
   - **User Threads** execute in user space, meaning they cannot directly access kernel space resources. They interact with the operating system via system calls, which involve a context switch to kernel space[3].

3. **Performance and Overhead**:
   - **Kernel Threads** can have a higher overhead due to context switching and system call invocations, which are more expensive operations because they transition control from user space to kernel space[3].
   - **User Threads** can be more efficient in terms of creation, synchronization, and context switching since these operations are done in user space without involving the kernel. However, they can suffer from inefficiencies when making blocking system calls, as this can block the entire process[3].

4. **Capabilities and Limitations**:
   - **Kernel Threads** can utilize multiple CPUs or cores for true parallel execution since the kernel controls their scheduling on the available hardware. They are also capable of executing system-level tasks[3].
   - **User Threads** are limited by the fact that a blocking operation (e.g., I/O) in one thread can block the entire process because the kernel sees the process as a single execution unit. However, they offer more flexibility in terms of custom scheduling policies and lower overhead for thread management[3].

In summary, kernel threads offer better integration with the operating system and can leverage multicore architectures more effectively, but with higher overhead. User threads provide more flexibility and efficiency for thread management but have limitations regarding blocking operations and cannot directly execute kernel-level tasks.

Citations:
[1] https://www.semanticscholar.org/paper/69d5dcc36f72b8fb2ea74bfef95d8ea3f3634156
[2] https://www.semanticscholar.org/paper/9c5b89bfce4e9cacdf75a7e5d84515abc62afe90
[3] https://www.semanticscholar.org/paper/0cf083a500c1c317aea7e65fa5c0cbdf725d5227
[4] https://www.semanticscholar.org/paper/537e735bf09238bf1123a9b55b79d92826380eed
[5] https://www.semanticscholar.org/paper/212703ebce8624dd2a4e1568a990011fc79b6aee
[6] https://arxiv.org/abs/2307.16693
[7] https://www.semanticscholar.org/paper/0fcab2984a10f9cb1bc96c87a4f3c176dffdb3b5
[8] https://www.semanticscholar.org/paper/a8b7708fe0c9d6b99251eed121b59394ca56795f


>	what are kernel threads



kernel threads refer to threads running in kernel space of virtual memory. 

their primary function is to handle interrupts, manage hardware devices, and perform system calls.


>	what does preempt mean in operating systems



>	what is the user space and kernel space

virtual memory is divided into two separate areas: kernel space and user space. user threads are threads managed by thread libraries in user space, and are invisible to the threads operating in kernel space.


>	what is virtual memory

set of fake memory addresses that abstracts interfacing with the computer's actual hierarchy of storage devices.

the idea is to give applications programs a set of fake memory addresses (called virtual addresses) to interface with as though they were physical hardware memory addresses. handle allocation/deallocation of data between main memory and disk to give the illusion that each applications program has its own contiguous array of bytes, so that they don't have to interface directly with the hierarchy of storage devices.
