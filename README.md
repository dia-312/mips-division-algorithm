📌 MIPS Division Algorithms — Manual vs Built-in 👤 Author

Dia Arar Computer Architecture Project — An-Najah National University

⭐ إذا أعجبك المشروع لا تنسَ وضع Star للريبو!

📘 Project Overview
This project implements and compares three different division methods in MIPS assembly:

Manual Sequential Division Algorithm

Enhanced Manual Algorithm (Optimized)

Built-in div Instruction

The goal is to measure execution time, understand shift-subtract logic, and observe the performance difference between software-level and hardware-level division.

📂 File Structure File Description manual_division.asm Implements a full 32-bit sequential division algorithm. enhanced_manual_division.asm Improved version with early-exit optimization and reduced unnecessary shifts. builtin_div.asm Uses hardware MIPS div instruction to measure its performance. report.docx Full technical report with test cases, tables, and analysis. 🧠 Algorithms Summary

Manual Division Algorithm
Based on:

32 cycles

Shift + subtract

Builds quotient bit-by-bit

📄 Source: manual_division.asm

manual_division

Enhanced Algorithm (Optimized)
Enhancements include:

Early exit when remaining bits cannot change result

Skip leading zeros

~15% performance improvement

📄 Source: enhanced_manual_division.asm

enhanced_manual_division

Built-in div Instruction
Fastest method using hardware division.

📄 Source: builtin_div.asm

builtin_div

🧪 Test Results Dividend Divisor Quotient Remainder Time (Manual) Time (DIV) Time (Enhanced) 300 15 20 0 800 6 700 1000 25 40 0 850 6 710 255 13 19 8 820 5 690 1024 2 512 0 860 5 705 777 10 77 7 815 6 700

📄 Full report:

temp_report

📊 Average Execution Times

Manual: 829 cycles

Built-in DIV: 5.6 cycles

Enhanced Manual: 701 cycles

📝 How to Run the Code

Open QtSpim or MARS.

Load any .asm file.

Run program (F5).

Observe quotient, remainder, and execution time printed to console.

📌 Conclusion

The hardware div instruction massively outperforms manual implementations. However, implementing the manual algorithm deepens understanding of:

Shift operations

Remainder tracking

Hardware vs software execution differences

The enhanced version achieves a noticeable optimization by skipping redundant cycles.

📧 Contact

If you have questions or want improvements, feel free to reach out!
