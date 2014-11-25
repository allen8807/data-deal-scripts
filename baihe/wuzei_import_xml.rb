# 解析XML文件
require 'rubygems'
require 'nokogiri'
require 'open-uri'

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
$inputParam = inputParam
$inputParam2 = 1
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
  @@tableName = "`crack_baihe`"
  @@tableNameStr = "crack_baihe"
  @@itemIdBegin = $inputParam2

  def self.getInsertSta(itemHash)

    colListStr = "( `id`,`user_name`,`encrypt_pwd`,`email`,`regip`,`regdate`,`salt`) "
    colValListStr = "VALUES (" + itemHash["uid"].to_s  + ", \""\
    +itemHash["username"].to_s + "\" , \""\
    +itemHash["password"].to_s + "\" , \""\
    +itemHash["email"].to_s + "\" , \""\
    +itemHash["regip"].to_s + "\" , \""\
    +itemHash["regdate"].to_s + "\" , \""\
    +itemHash["salt"].to_s + "\" );"
    sqlSt ="INSERT INTO "+ @@tableName.to_s + " " + colListStr + colValListStr
    return sqlSt
  end

  def self.Deal(inputFileName)

    inFileName = inputFileName
    inFile = File.new(inFileName,"r")
    outSqlFile = File.new(inFileName+".sql","w")
    #outSpcFile = File.new(inFileName+".spc","w")
    #outSpcSqlFile = File.new(inFileName+".spc.sql","w")
    #outErrEncodeFile =  File.new(inFileName+".enc","w")
    #outFileCatch = File.new(inFileName+".catch","w")
    outFileInfo = File.new(inFileName+".info","w")
    outSqlFile.puts("USE "+$databaseName.to_s+";")
    outSqlFile.puts("set autocommit=false;")
    page = Nokogiri::HTML(inFile)
    ei =  page.css('tr td')
    itemSt = {}

    #如果含有特殊字符取出来
    i = 0;
    lineAll = 0;
    lineSuc = 0;
    lineSpcSize = 0;
    lineSpcSym = 0;
    lineErrEncode = 0;
    lineCatch = 0;
    ticks = 0;
    outSqlFile.puts(Log.commit(ticks,@@tableNameStr,"begin insert baihe source id "+@@itemIdBegin.to_s + ", 1 tick means 100,000"))

    begin
    while(1)

      itemSt.clear
      itemSt["uid"] = ei.shift.text
      itemSt["username"] = ei.shift.text
      itemSt["password"] = ei.shift.text
      itemSt["email"] = ei.shift.text
      itemSt["myid"] = ei.shift.text
      itemSt["myidkey"] = ei.shift.text
      itemSt["regip"] = ei.shift.text
      itemSt["regdate"] = ei.shift.text
      itemSt["lastloginip"] = ei.shift.text
      itemSt["lastlogintime"] = ei.shift.text
      itemSt["salt"] = ei.shift.text
      itemSt["secques"] = ei.shift.text
      if itemSt["uid"] == "uid"
        next
      end

        i=i+1
      if(i>100000)
        i=0
        ticks=ticks+1
        outSqlFile.puts(Log.commit(ticks,@@tableNameStr,"next insert baihe source id "+@@itemIdBegin.to_s + ", 1 tick means 100,000"))
        outSqlFile.close
        outSqlFile =  File.new(inFileName+".sql","a")
      end
    #  puts itemSt.to_s

      lineAll=lineAll+1;

      if  !(itemSt["myid"] == "")
        puts "myid"+itemSt.to_s
      end
      if  !(itemSt["myidkey"] == "")
        puts "myidkey"+ itemSt.to_s
      end

      #if  !(itemSt["regdate"] == "1259056924")
      # puts  "regdate"+ itemSt.to_s
      #end
     # if  !(itemSt["regip"] == "124.40.116.43")
      #  puts  "regip"+ itemSt.to_s
      #end
      if  !(itemSt["lastloginip"] == "0")
        puts  "lastloginip"+ itemSt.to_s
      end
      if  !(itemSt["lastlogintime"] == "0")
        puts  "lastlogintime"+ itemSt.to_s
      end
      if  !(itemSt["secques"] == "")
        puts  "secques"+ itemSt.to_s
      end

      @@itemIdBegin=@@itemIdBegin+1
      outSqlFile.puts(DealFile.getInsertSta(itemSt))
      lineSuc = lineSuc+1;

      if ei.empty?
        break
      end
    end
    rescue => err
      puts err
      lineCatch=lineCatch+1;
    else


    ensure

      outFileInfo.puts("lineAll "+lineAll.to_s)
      outFileInfo.puts("lineSuc "+lineSuc.to_s)
      outFileInfo.puts("lineSpcSize "+lineSpcSize.to_s)
      outFileInfo.puts("lineSpcSym "+lineSpcSym.to_s)
      outFileInfo.puts("lineErrEncode "+lineErrEncode.to_s)
      outFileInfo.puts("lineCatch "+lineCatch.to_s)
      outFileInfo.puts("next @@itemIdBegin "+@@itemIdBegin.to_s)
      outSqlFile.puts(Log.commit(ticks,@@tableNameStr,"end insert baihe source id "+@@itemIdBegin.to_s + ", 1 tick means 100,000"))
      outSqlFile.puts("set autocommit=true;")
    end

    inFile.close
    outSqlFile.close
   # outSpcFile.close
    #outSpcSqlFile.close
   # outErrEncodeFile.close
   # outFileCatch.close
    outFileInfo.close
  end


  def self.ChangeCode(inputFileName)
    inFileName = inputFileName
    inFile = File.new(inFileName,"r")
    outGBKFile = File.new(inFileName+".gbk.utf8","w")
    outOthFile = File.new(inFileName+".other","w")

    while line = inFile.gets
      begin
        line_gbk = line.force_encoding("gbk")
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
DealFile.Deal(inputFileName)
#inputFileName=inputFileName+".enc"
#DealFile.ChangeCode(inputFileName)
#inputFileName = inputFileName+".gbk.utf8"
#DealFile.Deal(inputFileName)









#Struct.new(:uid,:username,:password,:email,:myid,:myidkey,:regip,:regdate,:lastloginip,:lastlogintime,:salt,:secques)











puts "-- End --"


