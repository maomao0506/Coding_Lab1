# 指向 Lab2 資料夾
ROOT_DIR := $(CURDIR)
SRC_DIR  := src
SIM_DIR  := sim
RSLT_DIR := result

# 工具與參數
VC       := iverilog
SIM      := vvp
# 關鍵：加上 -I (大寫 i) 讓編譯器去 src 找被 include 的檔案
VC_FLAG  := -g2012 -I $(ROOT_DIR)/$(SRC_DIR) -o

all: lab

$(RSLT_DIR):
	@mkdir -p $(RSLT_DIR)

lab: $(RSLT_DIR)
	@echo "--- Start compile ---"
	$(VC) $(VC_FLAG) $(RSLT_DIR)/sim_out $(SIM_DIR)/TB.v
	@echo "--- Compile finish, start simulation ---"
	@cd $(RSLT_DIR) && $(SIM) sim_out
	@echo "--- Simulation finish ---"

clean:
	@rm -rf $(RSLT_DIR)