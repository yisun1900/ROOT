<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.upload.*,java.sql.*,java.io.*, jxl.*,jxl.write.*'%>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>导木门报价</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body bgcolor="#FFFFFF">

<%
ybl.common.CommonFunction cf=new ybl.common.CommonFunction();

String yhdlm=(String)session.getAttribute("yhdlm");
String rootPath=getServletContext().getRealPath("");
String loadName=null;
String filename=null;
java.io.FileOutputStream f=null;

String dqbm = null;
String dqmc="";

String[][] outStr=null; 
String bgcolor=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs = null;
String sql = null;

String mmxh=null;
String ysmc=null;
String qhjgqjmc=null;
String ztmdjstr=null;
String dmsjgstr=null;
String dmtjgstr=null;
String mtjgstr=null;
String dkmtjgstr=null;
String zmmjgstr=null;
String zdmjjlstr=null;
String yksmjjlstr=null;
String ysbljjlstr=null;
String tlmpmdjstr=null;
String bz=null;


String ysbm=null;
String qhjgqjbm=null;
double ztmdj=0;
double dmsjg=0;
double dmtjg=0;
double mtjg=0;
double dkmtjg=0;
double zmmjg=0;
double zdmjjl=0;
double yksmjjl=0;
double ysbljjl=0;
double tlmpmdj=0;


int count=0;
int row=0;

try 
{
	conn=cf.getConnection();    //得到连接

	ybl.upload.Upload up=new ybl.upload.Upload(request,response.getWriter());
	up.initialize();

	dqbm =up.getParameter("dqbm");

	//获取文件内容
	byte[] buffer=up.getFileBuffer("loadName");

	//获取文件名称
	filename=rootPath+"\\jcjj\\mmjg\\impdata\\"+yhdlm+".xls";
	//写文件
	f=new java.io.FileOutputStream(filename);
	f.write(buffer,0,buffer.length-2);
	f.close();

	sql=" select dqmc" ;
	sql+=" from dm_dqbm " ;
	sql+=" where dqbm='"+dqbm+"'" ;
	ps= conn.prepareStatement(sql);
	rs=ps.executeQuery();
	if(rs.next())
	{         
		dqmc = rs.getString(1);			    
	}
	rs.close();
	ps.close();

	%> 
<form method="post" action="SaveImpData.jsp" name="editform" target="_blank">
<div align="center">替换全部主材报价（地区：<%=dqmc%>）</div>
<input name="dqbm" type="hidden" value="<%=dqbm%>" >
  <table width="120%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="3%">行号</td>
      <td width="6%">木门型号</td>
	  <td width="15%">木门材质</td>
      <td width="8%">墙厚价格区间</td>
      <td width="6%">整樘门单价</td>
      <td width="6%">单门扇价格</td>
      <td width="6%">单门套价格</td>
      <td width="6%">双口门套每米单价</td>
      <td width="6%">单口门套每米单价</td>
      <td width="4%">子母门加价率</td>
      <td width="4%">折叠门加价率</td>
      <td width="4%">哑口松木集成材加价率</td>
      <td width="4%">艺术玻璃加价率</td>
      <td width="6%">推拉门每平米单价</td>
      <td width="16%">备注</td>
    </tr>
    <%
	//读文件
	ybl.common.RWExce rwe=new ybl.common.RWExce();
	outStr=rwe.readExecel(5001,filename); 


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

		mmxh=outStr[i][0].trim();
		ysmc=outStr[i][1].trim();
		qhjgqjmc=outStr[i][2].trim();
		ztmdjstr=outStr[i][3].trim();
		dmsjgstr=outStr[i][4].trim();
		dmtjgstr=outStr[i][5].trim();
		mtjgstr=outStr[i][6].trim();
		dkmtjgstr=outStr[i][7].trim();
		zmmjgstr=outStr[i][8].trim();
		zdmjjlstr=outStr[i][9].trim();
		yksmjjlstr=outStr[i][10].trim();
		ysbljjlstr=outStr[i][11].trim();
		tlmpmdjstr=outStr[i][12].trim();
		bz=outStr[i][13].trim();


		if (mmxh.equals(""))
		{
			out.println("<BR>！！！行号["+row+"]错误，[木门型号]不能为空");
			return;
		}


		//木门材质
		if (ysmc!=null && !ysmc.equals(""))
		{
			ysbm="";
			sql=" select mmczbm" ;
			sql+=" from jdm_mmczbm " ;
			sql+=" where mmczmc='"+ysmc+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				ysbm = rs.getString(1);			    
			}
			rs.close();
			ps.close();

			if (ysbm.equals(""))
			{
				out.println("<BR>！！！行号["+row+"]错误，[木门材质]不存在");
				return;
			}
		}
		else{
			out.println("<BR>！！！行号["+row+"]错误，[木门材质]不能为空");
			return;
		}

		//墙厚价格区间
		if (qhjgqjmc!=null && !qhjgqjmc.equals(""))
		{
			qhjgqjbm="";
			sql=" select qhjgqjbm" ;
			sql+=" from jdm_qhjgqj " ;
			sql+=" where qhjgqj='"+qhjgqjmc+"'" ;
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{         
				qhjgqjbm = rs.getString(1);			    
			}
			rs.close();
			ps.close();

			if (qhjgqjbm.equals(""))
			{
				out.println("<BR>！！！行号["+row+"]错误，[墙厚价格区间]不存在");
				return;
			}
		}
		else{
			out.println("<BR>！！！行号["+row+"]错误，[墙厚价格区间]不能为空");
			return;
		}


		//整樘门单价
		ztmdj=0;
		if (ztmdjstr!=null && !ztmdjstr.equals(""))
		{
			try{
				ztmdj=Double.parseDouble(ztmdjstr);
			}
			catch (Exception e) {
				out.println("<BR>！！！行号["+row+"]错误，[整樘门单价]非数字：" + ztmdjstr);
				return;
			}
		}
		//单门扇价格
		dmsjg=0;
		if (dmsjgstr!=null && !dmsjgstr.equals(""))
		{
			try{
				dmsjg=Double.parseDouble(dmsjgstr);
			}
			catch (Exception e) {
				out.println("<BR>！！！行号["+row+"]错误，[单门扇价格]非数字：" + dmsjgstr);
				return;
			}
		}
		//单门套价格
		dmtjg=0;
		if (dmtjgstr!=null && !dmtjgstr.equals(""))
		{
			try{
				dmtjg=Double.parseDouble(dmtjgstr);
			}
			catch (Exception e) {
				out.println("<BR>！！！行号["+row+"]错误，[单门套价格]非数字：" + dmtjgstr);
				return;
			}
		}
		//双口门套每米单价
		mtjg=0;
		if (mtjgstr!=null && !mtjgstr.equals(""))
		{
			try{
				mtjg=Double.parseDouble(mtjgstr);
			}
			catch (Exception e) {
				out.println("<BR>！！！行号["+row+"]错误，[双口门套每米单价]非数字：" + mtjgstr);
				return;
			}
		}
		//单口门套每米单价
		dkmtjg=0;
		if (dkmtjgstr!=null && !dkmtjgstr.equals(""))
		{
			try{
				dkmtjg=Double.parseDouble(dkmtjgstr);
			}
			catch (Exception e) {
				out.println("<BR>！！！行号["+row+"]错误，[单口门套每米单价]非数字：" + dkmtjgstr);
				return;
			}
		}
		//子母门加价率
		zmmjg=0;
		if (zmmjgstr!=null && !zmmjgstr.equals(""))
		{
			try{
				zmmjg=Double.parseDouble(zmmjgstr);
			}
			catch (Exception e) {
				out.println("<BR>！！！行号["+row+"]错误，[子母门加价率]非数字：" + zmmjgstr);
				return;
			}
		}
		//折叠门加价率
		zdmjjl=0;
		if (zdmjjlstr!=null && !zdmjjlstr.equals(""))
		{
			try{
				zdmjjl=Double.parseDouble(zdmjjlstr);
			}
			catch (Exception e) {
				out.println("<BR>！！！行号["+row+"]错误，[折叠门加价率]非数字：" + zdmjjlstr);
				return;
			}
		}
		//哑口松木集成材加价率
		yksmjjl=0;
		if (yksmjjlstr!=null && !yksmjjlstr.equals(""))
		{
			try{
				yksmjjl=Double.parseDouble(yksmjjlstr);
			}
			catch (Exception e) {
				out.println("<BR>！！！行号["+row+"]错误，[哑口松木集成材加价率]非数字：" + yksmjjlstr);
				return;
			}
		}
		//艺术玻璃加价率
		ysbljjl=0;
		if (ysbljjlstr!=null && !ysbljjlstr.equals(""))
		{
			try{
				ysbljjl=Double.parseDouble(ysbljjlstr);
			}
			catch (Exception e) {
				out.println("<BR>！！！行号["+row+"]错误，[艺术玻璃加价率]非数字：" + ysbljjlstr);
				return;
			}
		}
		//推拉门每平米单价
		tlmpmdj=0;
		if (tlmpmdjstr!=null && !tlmpmdjstr.equals(""))
		{
			try{
				tlmpmdj=Double.parseDouble(tlmpmdjstr);
			}
			catch (Exception e) {
				out.println("<BR>！！！行号["+row+"]错误，[推拉门每平米单价]非数字：" + tlmpmdjstr);
				return;
			}
		}

%> 


	
	<tr bgcolor="<%=bgcolor%>" align="center"> 
      <td><%=row%></td>
      <td><%=mmxh%> 
        <input name="mmxh" type="hidden" value="<%=mmxh%>">
      </td>
      <td><%=ysmc%>
        <input name="ysbm" type="hidden" value="<%=ysbm%>" >
      </td>
      <td><%=qhjgqjmc%>
        <input name="qhjgqjbm" type="hidden" value="<%=qhjgqjbm%>" >
      </td>
      <td><%=ztmdjstr%>
        <input name="ztmdj" type="hidden" value="<%=ztmdj%>" >
      </td>
      <td><%=dmsjgstr%>
        <input name="dmsjg" type="hidden" value="<%=dmsjg%>" >
      </td>
      <td><%=dmtjgstr%>
        <input name="dmtjg" type="hidden" value="<%=dmtjg%>" >
      </td>
      <td><%=mtjgstr%>
        <input name="mtjg" type="hidden" value="<%=mtjg%>" >
      </td>
      <td><%=dkmtjgstr%>
        <input name="dkmtjg" type="hidden" value="<%=dkmtjg%>" >
      </td>
      <td><%=zmmjgstr%>
        <input name="zmmjg" type="hidden" value="<%=zmmjg%>" >
      </td>
      <td><%=zdmjjlstr%>
        <input name="zdmjjl" type="hidden" value="<%=zdmjjl%>" >
      </td>
      <td><%=yksmjjlstr%>
        <input name="yksmjjl" type="hidden" value="<%=yksmjjl%>" >
      </td>
      <td><%=ysbljjlstr%>
        <input name="ysbljjl" type="hidden" value="<%=ysbljjl%>" >
      </td>
      <td><%=tlmpmdjstr%>
        <input name="tlmpmdj" type="hidden" value="<%=tlmpmdj%>" >
      </td>
      <td align="left"><%=bz%>
        <input name="bz" type="hidden" value="<%=bz%>" >
      </td>
    </tr>
    <%
	}

}
catch (Exception e) {
	out.print("行号["+row+"]出错：" + e);
	return;
}
finally 
{
	try{
		f.close();
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn!=null) cf.close(conn);    //释放连接
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%> 
    <tr bgcolor="#CCCCCC" > 
      <td colspan="45"> 
        <input type="button"  value="存盘" name="bc" onClick="f_do(editform)">
        <input type="button"  value="存盘按钮可用" name="cxbc"  onClick="bc.disabled=false;cxbc.disabled=true" disabled>
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
	FormName.cxbc.disabled=false;
	return true;
}
//-->
</SCRIPT>
