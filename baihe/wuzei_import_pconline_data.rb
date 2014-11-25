#encoding=UTF-8

puts(ARGV)
if(ARGV.length>0 )
  inputParam = ARGV[0]
else
  inputParam = "test"
end
#if(ARGV.length>0 )
 # inputParam2 = Integer(ARGV[1])
#else
#  inputParam2 = 1
#end
$inputParam = "test"
$inputParam2 = 5443596
$databaseName = "wuzei_core"
class Log
  @@logTableName="`insert_log`"
  def self.setTableName(logTableName)
   @@logTableName = logTableName
  end
  def self.commit(ticks,table_name,desc)
    commitStr =  "set autocommit=true;\n"
    commitStr = commitStr +
        "INSERT INTO "+@@logTableName.to_s+" (`ticks`,`table_name`,`insert_time`,`desc`) VALUES ("+ticks.to_s+
     ", \""+table_name.to_s+ "\" , now(),\""+desc.to_s+"\" );\n"
    commitStr = commitStr+ "set autocommit=false;\n"
    return commitStr
  end

end

class DealFile
  @@tableName = "`crack_pconline`"
  @@tableNameStr = "crack_pconline"

  @@fieldNum = 3
  @@itemIdBegin = $inputParam2
=begin
  def self.Split(org_str)
    strS = org_str.split(/\s/)
    ss1 = strS[0]
    ss = org_str[ss1.length,org_str.length - ss1.length]
    ss.lstrip!
    strS = ss.split(/\s/)
    ss2 = strS[0]
    ss = ss[ss2.length,ss.length - ss2.length]
    ss3 = ss.lstrip

    strS = [""]
    strS[0] = ss1
    strS[1]=ss2
    strS[2] = ss3

    return strS
  end
=end
  def self.Split(org_str)
    strS = org_str.split(/\t/)
    return strS
  end

  def self.Deal(inputFileName)
    inFileName = inputFileName
    inFile = File.new(inFileName,"r")
    outSqlFile = File.new(inFileName+".sql","w")
    outSpcFile = File.new(inFileName+".spc","w")
    outSpcSqlFile = File.new(inFileName+".spc.sql","w")
    outErrEncodeFile =  File.new(inFileName+".enc","w")
    outFileCatch = File.new(inFileName+".catch","w")
    outFileInfo = File.new(inFileName+".info","w")
    outSqlFile.puts("USE "+$databaseName.to_s+";")
    outSqlFile.puts("set autocommit=false;")

#如果含有特殊字符取出来
    i = 0;
    lineAll = 0;
    lineSuc = 0;
    lineSpcSize = 0;
    lineSpcSym = 0;
    lineErrEncode = 0;
    lineCatch = 0;
    ticks = 0;
    outSqlFile.puts(Log.commit(ticks,@@tableNameStr,"begin insert pconline source id "+@@itemIdBegin.to_s + ", 1 tick means 100,000"))
    begin
      while line = inFile.gets
        i=i+1

        if(i>100000)
          i=0
          ticks=ticks+1
          outSqlFile.puts(Log.commit(ticks,@@tableNameStr,"next insert pconline source id "+@@itemIdBegin.to_s + ", 1 tick means 100,000"))
          outSqlFile.close
          outSqlFile =  File.new(inFileName+".sql","a")
        end

        lineAll=lineAll+1;
        if(!line.valid_encoding?)
          lineErrEncode=lineErrEncode+1;
          outErrEncodeFile.puts(line)
          next
        end
        #outFile.puts(line)


        begin


          line.lstrip!
          #line.lstrip!
          line.chomp!
          lines = DealFile.Split(line)
        rescue => err
          puts ("[line catch] "+err.to_s)
          lineCatch=lineCatch+1;
          outFileCatch.puts(line)
          next
        end


        if(lines.length != @@fieldNum)
          lineSpcSize = lineSpcSize+1;
            outFileCatch.puts(line)

        else
         # if(line.index('\'')!=nil || line.index("\"")!=nil || line.index("\\")!=nil)
          if(line.index("\"")!=nil || line.index("\\")!=nil)
            lineSpcSym = lineSpcSym+1;
            outSpcFile.puts(line)
            line.gsub!(/\\/,"\\\\\\\\")
            line.gsub!(/"/,"\\\"")
          #  line.gsub!(/'/,"\\\'")
            lines = DealFile.Split(line)
            spcSqlSt ="INSERT INTO "+@@tableName+" (`id`,`user_name`,`plain_pwd`,`email`) VALUES ("+@@itemIdBegin.to_s+
                ", \""+lines[0]+"\" , \""+lines[1]+"\" , \""+lines[2]+"\" );"
            @@itemIdBegin=@@itemIdBegin+1
            outSqlFile.puts(spcSqlSt)
            outSpcSqlFile.puts(spcSqlSt)
          else
            lineSuc = lineSuc+1;
            sqlSt ="INSERT INTO "+@@tableName+" (`id`,`user_name`,`plain_pwd`,`email`) VALUES ("+@@itemIdBegin.to_s+
                ", \""+lines[0]+"\" , \""+lines[1]+"\" , \""+lines[2]+"\" );"
            @@itemIdBegin=@@itemIdBegin+1
            outSqlFile.puts(sqlSt)
          end
        end
      end
    rescue => err
      puts err
    else


    ensure

      outFileInfo.puts("lineAll "+lineAll.to_s)
      outFileInfo.puts("lineSuc "+lineSuc.to_s)
      outFileInfo.puts("lineSpcSize "+lineSpcSize.to_s)
      outFileInfo.puts("lineSpcSym "+lineSpcSym.to_s)
      outFileInfo.puts("lineErrEncode "+lineErrEncode.to_s)
      outFileInfo.puts("lineCatch "+lineCatch.to_s)
      outFileInfo.puts("next @@itemIdBegin "+@@itemIdBegin.to_s)
      outSqlFile.puts(Log.commit(ticks,@@tableNameStr,"end insert pconline source id "+@@itemIdBegin.to_s + ", 1 tick means 100,000"))
      outSqlFile.puts("set autocommit=true;")
    end

    inFile.close
    outSqlFile.close
    outSpcFile.close
    outSpcSqlFile.close
    outErrEncodeFile.close
    outFileCatch.close
    outFileInfo.close
  end


  def self.ChangeCode(inputFileName)
    inFileName = inputFileName
    inFile = File.new(inFileName,"r")
    outGBKFile = File.new(inFileName+".gbk.utf8","w")
    outOthFile = File.new(inFileName+".other","w")

    while line = inFile.gets
      begin
        line_gbk = line.force_encoding("gb18030")
        line = line_gbk.encode("utf-8")
      rescue => err
        puts err
        outOthFile.puts(line)
        next
      else
        outGBKFile.puts(line)
        next
      end
    end

    inFile.close
    outGBKFile.close
    outOthFile.close

  end

end


inputFileName = $inputParam
#DealFile.Deal(inputFileName)
#inputFileName=inputFileName+".enc"
DealFile.ChangeCode(inputFileName)
#inputFileName = inputFileName+".gbk.utf8"
#DealFile.Deal(inputFileName)
