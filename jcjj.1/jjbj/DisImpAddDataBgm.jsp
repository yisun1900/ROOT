<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>增加报价</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF" style="FONT-SIZE:16">
<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletConfig().getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;


String[][] outStr=null; 
String bgcolor=null;

String xuhao=null;
String xcmlxbm=null;
String xcmlxmc=null;
String jjpjflbm=null;
String bklxxh=null;
String mbcl=null;
String xbpz=null;
String zsxt=null;
String jjfs=null;
String jjfsStr=null;
String pmdjStr=null;
String ymdjStr=null;
String zpmc=null;
String bz=null;

double pmdj=0;
double ymdj=0;

int count=0;

try 
{
	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\jcjj\\jjbj\\impdata\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();
	
	%> 
<form method="post" action="SaveImpAddDataBgm.jsp" name="editform" >
  <div align="center">增加[型材门]报价</div>
  <table width="130%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
		<td  width="3%">序号</td>
		<td  width="5%">型材门类型</td>
		<td align="left" width="10%"><strong>推拉门</strong>：边框型号<BR>
	      <strong>吸塑</strong>：刀型<BR>
          <strong>包覆</strong>：刀型<BR>
          <strong>板材铝门</strong>：门型</td>
		<td align="left" width="10%"><strong>推拉门</strong>：材料<BR>
		  <strong>吸塑</strong>：花色<BR>
		  <strong>包覆</strong>：花色<BR>
	      <strong>板材铝门</strong>：材料</td>
		<td  width="9%">芯板配置</td>
		<td  width="9%">装饰线条</td>
		<td  width="7%">计价方式</td>
		<td  width="6%">平米单价</td>
		<td  width="6%">延米单价</td>
		<td  width="8%">照片名称</td>
		<td  width="27%">备注</td>
    </tr>
<%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(5001,filename); 


	int row=0;
	for (int i=1;i<outStr.length ;i++ )
	{
		row++;
		if (i%2==1)
		{
			bgcolor="#FFFFFF";
		}
		else{
			bgcolor="#E8E8FF";
		}

		if (outStr[i][0]==null || outStr[i][0].equals(""))
		{
			out.println("提醒!第"+i+"行[数据]为空,下面的数据自动被放弃");
			break;
		}

		xuhao=outStr[i][0].trim();
		xcmlxmc=outStr[i][1].trim();
		bklxxh=outStr[i][2].trim();
		mbcl=outStr[i][3].trim();
		xbpz=outStr[i][4].trim();
		zsxt=outStr[i][5].trim();
		jjfsStr=outStr[i][6].trim();
		pmdjStr=outStr[i][7].trim();
		ymdjStr=outStr[i][8].trim();
		zpmc=outStr[i][9].trim();
		bz=outStr[i][10].trim();

		if (xcmlxmc.equals("推拉门"))//01:推拉门；02：吸塑；03：包覆；04：板材铝门
		{
			xcmlxbm="01";
		}
		else if (xcmlxmc.equals("吸塑"))
		{
			xcmlxbm="02";
		}
		else if (xcmlxmc.equals("包覆"))
		{
			xcmlxbm="03";
		}
		else if (xcmlxmc.equals("板材铝门"))
		{
			xcmlxbm="04";
		}
		else if (xcmlxmc.equals(""))
		{
			out.println("<BR>！！！序号["+xuhao+"]错误，[型材门类型]不能为空");
			return;
		}
		else{
			out.println("<BR>！！！序号["+xuhao+"]错误，[型材门类型]只能是【推拉门、吸塑、包覆、板材铝门】之一，录入为："+xcmlxmc);
			return;
		}

		if (bklxxh.equals(""))
		{
			out.println("<BR>！！！序号["+xuhao+"]错误，[边框系列型号]不能为空");
			return;
		}
		if (mbcl.equals(""))
		{
			out.println("<BR>！！！序号["+xuhao+"]错误，[面板材料]不能为空");
			return;
		}

		if (jjfsStr.equals("平米单价"))//1：平米单价、2：平米单价加封边延米单价
		{
			jjfs="1";
		}
		else if (jjfsStr.equals("平米单价加封边延米单价"))
		{
			jjfs="2";
		}
		else if (jjfsStr.equals(""))
		{
			out.println("<BR>！！！序号["+xuhao+"]错误，[计价方式]不能为空");
			return;
		}
		else{
			out.println("<BR>！！！序号["+xuhao+"]错误，[计价方式]只能是【平米单价、平米单价加封边延米单价】之一，录入为："+jjfsStr);
			return;
		}

		//平米单价
		pmdj=0;
		if (pmdjStr!=null && !pmdjStr.trim().equals(""))
		{
			try{
				pmdj=Double.parseDouble(pmdjStr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[平米单价]非数字：" + pmdjStr);
				return;
			}
		}
		else{
			out.println("<BR>！！！序号["+xuhao+"]错误，[平米单价]不能为空");
			return;
		}

		if (pmdj==0)
		{
			out.println("<BR>！！！序号["+xuhao+"]错误，[平米单价]不能为0");
			return;
		}

		//延米单价
		ymdj=0;
		if (ymdjStr!=null && !ymdjStr.trim().equals(""))
		{
			try{
				ymdj=Double.parseDouble(ymdjStr.trim());
			}
			catch (Exception e) {
				out.print("序号["+xuhao+"]出错！[延米单价]非数字：" + ymdjStr);
				return;
			}
		}

		if (jjfs.equals("1"))//1：平米单价；2：平米单价＋封边延米单价
		{
			if (ymdj!=0)
			{
				out.println("<BR>！！！序号["+xuhao+"]错误，只按平米计价，[延米单价]必须为0，录入为："+ymdj);
				return;
			}
		}
		else{
			if (ymdj==0)
			{
				out.println("<BR>！！！序号["+xuhao+"]错误，计价按平米单价＋封边延米单价，[延米单价]不能为0，录入为："+ymdj);
				return;
			}
		}

		%> 
		<tr bgcolor="<%=bgcolor%>" align="center"> 
		  <td><%=xuhao%> 
			<input name="xuhao" type="hidden" value="<%=xuhao%>">
		  </td>
		  <td><%=xcmlxmc%> 
			<input name="xcmlxbm" type="hidden" value="<%=xcmlxbm%>">
		  </td>
		  <td><%=bklxxh%>
			<input name="bklxxh" type="hidden" value="<%=bklxxh%>" >
		  </td>
		  <td><%=mbcl%>
			<input name="mbcl" type="hidden" value="<%=mbcl%>" >
		  </td>
		  <td><%=xbpz%>
			<input name="xbpz" type="hidden" value="<%=xbpz%>" >
		  </td>
		  <td><%=zsxt%>
			<input name="zsxt" type="hidden" value="<%=zsxt%>" >
		  </td>
		  <td><%=jjfsStr%>
			<input name="jjfs" type="hidden" value="<%=jjfs%>" >
		  </td>
		  <td><%=pmdj%>
			<input name="pmdj" type="hidden" value="<%=pmdj%>" >
		  </td>
		  <td><%=ymdjStr%>
			<input name="ymdj" type="hidden" value="<%=ymdj%>" >
		  </td>
		  <td ><%=zpmc%>
			<input name="zpmc" type="hidden" value="<%=zpmc%>" >
		  </td>
		  <td align="left"><%=bz%>
			<input name="bz" type="hidden" value="<%=bz%>" >
		  </td>
		</tr>
		<%
	}

	rwe=null;
}
catch (Exception e) {
	out.print("出错：" + e);
	return;
}
finally 
{
	outStr=null; 
	try{
		f.close();
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%> 
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="存盘" name="bc" onClick="f_do(editform)">
      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	FormName.submit();
	FormName.bc.disabled=true;
	return true;
}
//-->
</SCRIPT>
