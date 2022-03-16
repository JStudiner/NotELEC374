def handleInstr(type, ra, rb, rc, const):
  if (type == "ld"):
    return "00000" + handleReg(ra) + handleReg(rb) + handleConstant(const, 19);
  elif (type == "ldi"):
    return "00001" + handleReg(ra) + handleReg(rb) + handleConstant(const, 19);
  elif (type == "st"):
    return "00010" + handleReg(ra) + handleReg(rb) + handleConstant(const, 19);
  elif (type == "add"):
    return "00011" + handleReg(ra) + handleReg(rb) + handleReg(rc) + addZeros(15);
  elif (type == "sub"):
    return "00100" + handleReg(ra) + handleReg(rb) + handleReg(rc) + addZeros(15);
  elif (type == "shr"):
    return "00101" + handleReg(ra) + handleReg(rb) + handleReg(rc) + addZeros(15);
  elif (type == "shl"):
    return "00110" + handleReg(ra) + handleReg(rb) + handleReg(rc) + addZeros(15);
  elif (type == "ror"):
    return "00111" + handleReg(ra) + handleReg(rb) + handleReg(rc) + addZeros(15);
  elif (type == "rol"):
    return "01000" + handleReg(ra) + handleReg(rb) + handleReg(rc) + addZeros(15);
  elif (type == "and"):
    return "01001" + handleReg(ra) + handleReg(rb) + handleReg(rc) + addZeros(15);
  elif (type == "or"):
    return "01010" + handleReg(ra) + handleReg(rb) + handleReg(rc) + addZeros(15);
  elif (type == "addi"):
    return "01011" + handleReg(ra) + handleReg(rb) + handleConstant(const, 19);
  elif (type == "andi"):
    return "01100" + handleReg(ra) + handleReg(rb) + handleConstant(const, 19);
  elif (type == "ori"):
    return "01101" + handleReg(ra) + handleReg(rb) + handleConstant(const, 19);
  elif (type == "mul"):
    return "01110" + handleReg(ra) + handleReg(rb) + addZeros(19);
  elif (type == "div"):
    return "01111" + handleReg(ra) + handleReg(rb) + addZeros(19);
  elif (type == "neg"):
    return "10000" + handleReg(ra) + handleReg(rb) + addZeros(19);
  elif (type == "not"):
    return "10001" + handleReg(ra) + handleReg(rb) + addZeros(19);
  elif (type == "brzr"):
    return "10010" + handleReg(ra) + "0000" + handleConstant(const, 19);
  elif (type == "brnz"):
    return "10010" + handleReg(ra) + "0001" + handleConstant(const, 19);
  elif (type == "brpl"):
    return "10010" + handleReg(ra) + "0010" + handleConstant(const, 19);
  elif (type == "brmi"):
    return "10010" + handleReg(ra) + "0011" + handleConstant(const, 19);
  elif (type == "jr"):
    return "10011" + handleReg(ra) + addZeros(23);
  elif (type == "jal"):
    return "10100" + handleReg(ra) + addZeros(23);
  elif (type == "in"):
    return "10101" + handleReg(ra) + addZeros(23);
  elif (type == "out"):
    return "10110" + handleReg(ra) + addZeros(23);
  elif (type == "mfhi"):
    return "10111" + handleReg(ra) + addZeros(23);
  elif (type == "mflo"):
    return "11000" + handleReg(ra) + addZeros(23);
  elif (type == "nop"):
    return "11001" + addZeros(27);
  elif (type == "halt"):
    return "11010" + addZeros(27);
  else:
    return "11111111111111111111111111111111"; # instr not recog.

def handleReg(r):
  return bin(r).replace("0b", "").zfill(4);

def handleConstant(const, digits):
  constDec = int(const, 16);
  return bin(constDec).replace("0b", "").zfill(digits);

def addZeros(num):
  return "".zfill(num);

  
def unhandleReg(regIn):
  temp = int(regIn[0]) * 8 + int(regIn[1]) * 4 + int(regIn[2]) * 2 + int(regIn[3]) * 1
  return "R" + str(temp)

def unhandleCnst(cnstIn):
  return hex(int(cnstIn, 2))
  
def unhandleOp(opcode):
  if opcode == "00000":
    return "ld"
  elif opcode == "00001":
    return "ldi"
  elif opcode == "00010":
    return "st"
  elif opcode == "00011":
    return "add"
  elif opcode == "00100":
    return "sub"
  elif opcode == "00101":
    return "shr"
  elif opcode == "00110":
    return "shl"
  elif opcode == "00111":
    return "ror"
  elif opcode == "01000":
    return "rol"
  elif opcode == "01001":
    return "and"
  elif opcode == "01010":
    return "or"
  elif opcode == "01011":
    return "addi"
  elif opcode == "01100":
    return "andi"
  elif opcode == "01101":
    return "ori"
  elif opcode == "01110":
    return "mul"
  elif opcode == "01111":
    return "div"
  elif opcode == "10000":
    return "neg"
  elif opcode == "10001":
    return "not"
  elif opcode == "10010":
    return "br"
  elif opcode == "10011":
    return "jr"
  elif opcode == "10100":
    return "jal"
  elif opcode == "10101":
    return "in"
  elif opcode == "10110":
    return "out"
  elif opcode == "10111":
    return "mfhi"
  elif opcode == "11000":
    return "mflo"
  elif opcode == "11001":
    return "nop"
  elif opcode == "11010":
    return "halt"
  return "what"

def binToInstr(binry):
  opcode = binry[0:5]
  ra_ = binry[5:9]
  rb_ = binry[9:13]
  rc_ = binry[13:17]
  cnstnt = binry[17:]
  # R format
  rFormat = ["00011", "00100", "00101", "00110", "00111", "01000", "01001", "01010"]
  iCnst = ["00000", "00001", "00010", "01011", "01100", "01101"]
  iUnused = ["01110", "01111", "10000", "10001"]
  bFormat = ["10010"]
  jFormat = ["10011", "10100", "10101", "10110", "10111", "11000"]
  mFormat = ["11001", "11010"]
  
  if opcode in rFormat:  # add sub and or shr shl ror rol
    return unhandleOp(opcode) + " " + unhandleReg(ra_) + ", " + unhandleReg(rb_) + ", " + unhandleReg(rc_)
  elif opcode in iCnst: # ld, ldi, stw, addi, andi, ori
    return unhandleOp(opcode) + " " + unhandleReg(ra_) + ", " + unhandleReg(rb_) + ", " + unhandleCnst(cnstnt)
  elif opcode in iUnused: # mul, div, neg, not
    return unhandleOp(opcode) + " " + unhandleReg(ra_) + ", " + unhandleReg(rb_)
  elif opcode in bFormat: # branch brzr, brnz, brmi, brpl
    brTemp = "XX"
    if rb_[0:2] == "00":
      brTemp = "zr"
    if rb_[0:2] == "01":
      brTemp = "nz"
    if rb_[0:2] == "10":
      brTemp = "pl"
    if rb_[0:2] == "11":
      brTemp = "mi"
    return unhandleOp(opcode) + brTemp + " " + unhandleReg(ra_) + ", " + unhandleCnst(cnstnt)
  elif opcode in jFormat: # jr, jal
    return unhandleOp(opcode) + " " + unhandleReg(ra_)
  elif opcode in mFormat: # nop, halt
    return unhandleOp(opcode)
  return "broken op codee"



print ("This program compiles an instr to a op-code pattern");
type = input("Input instruction type (ex. ld, ldi, st, add, etc.): ");
ra = int(input ("Input Ra # (ex. 4 for R4) (null if not applicable): ") or 0);
rb = int(input ("Input Rb # (ex. 4 for R4) (null if not applicable): ") or 0);
rc = int(input ("Input Rc # (ex. 4 for R4) (null if not applicable): ") or 0);
const = input ("Input Constant in HEX (MUST BE 19 BITS if -'ve') (null if not applicable): ") or "0";

binary = handleInstr(type, ra, rb, rc, const);
hexi = "0x" + hex(int(binary, 2)).replace("0x", "").zfill(8);
print("Hexidecimal representation:\n" + hexi)
print ("\n\n Verify the following matches your input: " + binToInstr(binary))
