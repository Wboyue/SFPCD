onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /gcdtestbench/clock
add wave -noupdate -radix decimal /gcdtestbench/rst
add wave -noupdate -radix decimal /gcdtestbench/input_ava
add wave -noupdate -radix decimal /gcdtestbench/r_t
add wave -noupdate -radix decimal /gcdtestbench/in_A
add wave -noupdate -radix decimal /gcdtestbench/in_B
add wave -noupdate -radix decimal /gcdtestbench/r_data
add wave -noupdate -radix decimal /gcdtestbench/idle
add wave -noupdate -radix decimal /gcdtestbench/r_rdy
add wave -noupdate -radix decimal /gcdtestbench/state
add wave -noupdate -radix decimal /gcdtestbench/U1/operand_A
add wave -noupdate -radix decimal /gcdtestbench/U1/operand_B
add wave -noupdate -radix decimal /gcdtestbench/U1/clk
add wave -noupdate -radix decimal /gcdtestbench/U1/reset
add wave -noupdate -radix decimal /gcdtestbench/U1/input_available
add wave -noupdate -radix decimal /gcdtestbench/U1/result_taken
add wave -noupdate -radix decimal /gcdtestbench/U1/result_data
add wave -noupdate -radix decimal /gcdtestbench/U1/idle
add wave -noupdate -radix decimal /gcdtestbench/U1/result_rdy
add wave -noupdate -radix decimal /gcdtestbench/U1/state
add wave -noupdate -radix decimal /gcdtestbench/U1/state_next
add wave -noupdate -radix decimal /gcdtestbench/U1/A
add wave -noupdate -radix decimal /gcdtestbench/U1/B
add wave -noupdate -radix decimal /gcdtestbench/U1/A_next
add wave -noupdate -radix decimal /gcdtestbench/U1/B_next
add wave -noupdate -radix decimal /gcdtestbench/U1/swap
add wave -noupdate -radix decimal /gcdtestbench/U1/result_data_next
add wave -noupdate -radix decimal /gcdtestbench/U1/result_rdy_next
add wave -noupdate -radix decimal /gcdtestbench/U1/A_sel
add wave -noupdate -radix decimal /gcdtestbench/U1/B_sel
add wave -noupdate -radix decimal /gcdtestbench/U1/A_en
add wave -noupdate -radix decimal /gcdtestbench/U1/B_en
add wave -noupdate -radix decimal /gcdtestbench/U1/B_zero
add wave -noupdate -radix decimal /gcdtestbench/U1/A_lt_B
add wave -noupdate -radix decimal /gcdtestbench/U1/idle_next
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {28890 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 118
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {158530 ps}
