<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 18px;
	font-weight: bold;
}
-->
</style>
  <style media="print">

    .noprint { display: none }

  </style>

</head>


<%
String khbh=request.getParameter("khbh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;

String bjjb=null;
String jjrksg=null;
String jjrksgmc=null;
String fwdz=null;
String  gj=null;
String  dd=null;
String  sgd=null;
String sgbz=null;
String khxm=null;
String kgrq=null;
String jgrq=null;
String sjs=null;

String logo=null;

try {
	conn=cf.getConnection();

	ls_sql="select bjjb,jjrksg,DECODE(jjrksg,'1','节、假日不可施工','2','节日不可施工','9','节、假日可施工') jjrksgmc,fwdz,gj,dd,sgdmc,sgbz,khxm,kgrq,jgrq,sjs";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		bjjb=cf.fillNull(rs.getString("bjjb"));
		jjrksg=cf.fillNull(rs.getString("jjrksg"));
		jjrksgmc=cf.fillHtml(rs.getString("jjrksgmc"));

		fwdz=rs.getString("fwdz");
		gj=cf.fillHtml(rs.getString("gj"));
		dd=cf.fillHtml(rs.getString("dd"));
		sgd=cf.fillHtml(rs.getString("sgdmc"));
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		khxm=rs.getString("khxm");
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
		sjs=rs.getString("sjs");
	}
	rs.close();
	ps.close();

	if (bjjb.equals("A") || bjjb.equals("B") || bjjb.equals("C"))
	{
		logo="tellmach.jpg";
	} 
	else if (bjjb.equals("D") || bjjb.equals("E") || bjjb.equals("F"))
	{
		logo="boloni.jpg";
	} 

	int count=0;

	java.sql.Date date1=null;
	java.sql.Date date2=null;
	ls_sql="select min(jhkssj) ,max(jhjssj) ";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		date1=rs.getDate(1);
		date2=rs.getDate(2);
	}
	rs.close();
	ps.close();

	if (date1==null || date2==null)
	{
		out.println("错误！未录入时间");
		return;
	}

	if (date1.compareTo(date2)>0)
	{
		out.println("错误！计划结束日期小于开始日期");
		return;
	}

	//日期总数
	int rqzl=0;
	ls_sql="select count(*)";
	ls_sql+=" from  dm_gzrl";
	ls_sql+=" where rq>=? and rq<=?";
	if (jjrksg.equals("1"))//1：节、假日不可施工
	{
		ls_sql+=" and jjrbz='N'";
	}
	else if (jjrksg.equals("2"))//2：节日不可施工
	{
		ls_sql+=" and jjrlx not in('3','8')";//1：周六；2：周日；3：节日；8：其它；9：非节假日
	}
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,date1);
	ps.setDate(2,date2);
	rs =ps.executeQuery();
	if (rs.next())
	{
		rqzl=rs.getInt(1);
	}
	rs.close();
	ps.close();
%>
<OBJECT id="WebBrowser" height="0" width="0" classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2" VIEWASTEXT>
  </OBJECT>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
  <div>
   <table width="100%" cellpadding="0" cellspacing="0" style='FONT-SIZE: 12px'>
	<tr>
	   <td width="5%">
	   <center class=noprint><input type=button name="" value="导出" onClick="javascript:window.open('xmrwglToExcel.jsp?khbh=<%=khbh%>');">
	   <input onClick="document.all.WebBrowser.ExecWB(6,1)" type="button" value="打印">
	     <input onClick="document.all.WebBrowser.ExecWB(8,1)" type="button" value="页面设置">
		<input onClick="document.all.WebBrowser.ExecWB(7,1)" type="button" value="打印预览">
		</center>

	 </td>
     </tr>
	 <tr><td width="100%">
   
	 <table  border="1" width="<%=(15+145+15+60+60+25+rqzl*10)%>px" cellpadding="0" cellspacing="0" style='FONT-SIZE: 12px'>
	 <tr>
	   <td width="22%" rowspan="2" valign="middle">
	   <image src="/images/<%=logo%>" height='30px'> <span class="STYLE1">整体项目进度表</span></td>
	 
	     <td width="13%" >姓名:<%=khxm%></td>
		 <td colspan="2" >实际工期:<%=kgrq%>至<%=jgrq%></td>
		 <td width="12%" >家装设计师:<%=sjs%></td>
		 <td width="12%" >橱/内设计师:</td>
		 <td width="12%" >卫浴设计师:</td>
		 <td width="12%" >家具设计师:</td>
	    </tr>
	   <tr >
	     <td colspan="2">地址:<%=fwdz%></td>
		 <td width="11%"><%=jjrksgmc%></td>
		 <td>项目管家:<%=gj%></td>
		 <td>大工长姓名:<%=sgd%></td>
		 <td>现场责任人:<%=sgbz%></td>
		 <td>家装履约专员:<%=dd%></td>
	    </tr>
	 </table>
   </td></tr>
  </div>
<tr><td width="100%">
  <table border="1" width="<%=(15+145+15+60+60+25+rqzl*10)%>px" cellspacing="0" cellpadding="0"  style='FONT-SIZE:8px' >
    <tr  align="center" bgcolor="#FFFFCC"> 
		<td width="15px" rowspan="3">序号</td>
		
		<td width="145px" rowspan="3" >任务名称</td>
		<td width="15px" rowspan="3">工期</td>
		<td width="60px"rowspan="3">计划开始</td>
		<td width="60px"rowspan="3">计划结束</td>
		<td width="25px" rowspan="3">备注</td>
	

<%

	int nian=0;
	int yue=0;
	int rqsl=0;
	ls_sql="select nian,yue,count(*) rqsl";
	ls_sql+=" from  dm_gzrl";
	ls_sql+=" where rq>=? and rq<=?";
	if (jjrksg.equals("1"))//1：节、假日不可施工
	{
		ls_sql+=" and jjrbz='N'";
	}
	else if (jjrksg.equals("2"))//2：节日不可施工
	{
		ls_sql+=" and jjrlx not in('3','8')";//1：周六；2：周日；3：节日；8：其它；9：非节假日
	}
	ls_sql+=" group by nian,yue";
	ls_sql+=" order by nian,yue";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,date1);
	ps.setDate(2,date2);
	rs =ps.executeQuery();
	while (rs.next())
	{
		nian=rs.getInt("nian");
		yue=rs.getInt("yue");
		rqsl=rs.getInt("rqsl");

		%>
		<td colspan="<%=rqsl%>"><%=yue%>月</td>
		<%
	}
	rs.close();
	ps.close();


	%>
	</TR>

    <tr  align="center" bgcolor="#FFFFCC"> 
	<%
	int ri=0;

	ls_sql="select nian,yue";
	ls_sql+=" from  dm_gzrl";
	ls_sql+=" where rq>=? and rq<=?";
	if (jjrksg.equals("1"))//1：节、假日不可施工
	{
		ls_sql+=" and jjrbz='N'";
	}
	else if (jjrksg.equals("2"))//2：节日不可施工
	{
		ls_sql+=" and jjrlx not in('3','8')";//1：周六；2：周日；3：节日；8：其它；9：非节假日
	}
	ls_sql+=" group by nian,yue";
	ls_sql+=" order by nian,yue";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,date1);
	ps.setDate(2,date2);
	rs =ps.executeQuery();
	while (rs.next())
	{
		nian=rs.getInt("nian");
		yue=rs.getInt("yue");

		
		rqsl=0;
		ls_sql="select count(*) rqsl";
		ls_sql+=" from  dm_gzrl";
		ls_sql+=" where rq>=? and rq<=?";
		if (jjrksg.equals("1"))//1：节、假日不可施工
		{
			ls_sql+=" and jjrbz='N'";
		}
		else if (jjrksg.equals("2"))//2：节日不可施工
		{
			ls_sql+=" and jjrlx not in('3','8')";//1：周六；2：周日；3：节日；8：其它；9：非节假日
		}
		ls_sql+=" and nian="+nian+" and yue="+yue;
		ls_sql+=" and ri<10";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,date1);
		ps1.setDate(2,date2);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			rqsl=rs1.getInt("rqsl");
		}
		rs1.close();
		ps1.close();

		if (rqsl>0)
		{
			%>
			<td colspan="<%=rqsl%>">0</td>
			<%
		}

		rqsl=0;
		ls_sql="select count(*) rqsl";
		ls_sql+=" from  dm_gzrl";
		ls_sql+=" where rq>=? and rq<=?";
		if (jjrksg.equals("1"))//1：节、假日不可施工
		{
			ls_sql+=" and jjrbz='N'";
		}
		else if (jjrksg.equals("2"))//2：节日不可施工
		{
			ls_sql+=" and jjrlx not in('3','8')";//1：周六；2：周日；3：节日；8：其它；9：非节假日
		}
		ls_sql+=" and nian="+nian+" and yue="+yue;
		ls_sql+=" and ri>=10 and ri<20";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,date1);
		ps1.setDate(2,date2);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			rqsl=rs1.getInt("rqsl");
		}
		rs1.close();
		ps1.close();

		if (rqsl>0)
		{
			%>
			<td colspan="<%=rqsl%>">1</td>
			<%
		}

		rqsl=0;
		ls_sql="select count(*) rqsl";
		ls_sql+=" from  dm_gzrl";
		ls_sql+=" where rq>=? and rq<=?";
		if (jjrksg.equals("1"))//1：节、假日不可施工
		{
			ls_sql+=" and jjrbz='N'";
		}
		else if (jjrksg.equals("2"))//2：节日不可施工
		{
			ls_sql+=" and jjrlx not in('3','8')";//1：周六；2：周日；3：节日；8：其它；9：非节假日
		}
		ls_sql+=" and nian="+nian+" and yue="+yue;
		ls_sql+=" and ri>=20 and ri<30";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,date1);
		ps1.setDate(2,date2);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			rqsl=rs1.getInt("rqsl");
		}
		rs1.close();
		ps1.close();

		if (rqsl>0)
		{
			%>
			<td colspan="<%=rqsl%>">2</td>
			<%
		}

		rqsl=0;
		ls_sql="select count(*) rqsl";
		ls_sql+=" from  dm_gzrl";
		ls_sql+=" where rq>=? and rq<=?";
		if (jjrksg.equals("1"))//1：节、假日不可施工
		{
			ls_sql+=" and jjrbz='N'";
		}
		else if (jjrksg.equals("2"))//2：节日不可施工
		{
			ls_sql+=" and jjrlx not in('3','8')";//1：周六；2：周日；3：节日；8：其它；9：非节假日
		}
		ls_sql+=" and nian="+nian+" and yue="+yue;
		ls_sql+=" and ri>=30";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,date1);
		ps1.setDate(2,date2);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			rqsl=rs1.getInt("rqsl");
		}
		rs1.close();
		ps1.close();

		if (rqsl>0)
		{
			%>
			<td colspan="<%=rqsl%>">3</td>
			<%
		}
	}
	rs.close();
	ps.close();


	%>
	</TR>

    <tr  align="center" bgcolor="#FFFFCC"> 
	<%

	ls_sql="select nian,yue,ri";
	ls_sql+=" from  dm_gzrl";
	ls_sql+=" where rq>=? and rq<=?";
	if (jjrksg.equals("1"))//1：节、假日不可施工
	{
		ls_sql+=" and jjrbz='N'";
	}
	else if (jjrksg.equals("2"))//2：节日不可施工
	{
		ls_sql+=" and jjrlx not in('3','8')";//1：周六；2：周日；3：节日；8：其它；9：非节假日
	}
	ls_sql+=" order by nian,yue,ri";
	ps= conn.prepareStatement(ls_sql);
	ps.setDate(1,date1);
	ps.setDate(2,date2);
	rs =ps.executeQuery();
	while (rs.next())
	{
		nian=rs.getInt("nian");
		yue=rs.getInt("yue");
		ri=rs.getInt("ri");

		if (ri<10)
		{
			%>
			<td width="10px"><%=ri%></td>
			<%
		}
		else if (ri<20)
		{
			%>
			<td width="10px"><%=(ri-10)%></td>
			<%
		}
		else if (ri<30)
		{
			%>
			<td width="10px"><%=(ri-20)%></td>
			<%
		}
		else{
			%>
			<td width="10px"><%=(ri-30)%></td>
			<%
		}
	}
	rs.close();
	ps.close();


	%>
	</TR>

	<%

	int rwxh=0;
	int row=0;
	String rwbm=null;
	String rwmc=null;

	java.sql.Date jhkssj=null;
	java.sql.Date jhjssj=null;
	int jhgzr=0;
	String sjkssj="";
	String sjjssj="";
	int sjgzr=0;
	ls_sql="select rwxh,rwbm,rwmc,jhkssj,jhjssj,jhgzr,sjkssj,sjjssj,sjgzr ";
	ls_sql+=" from  crm_xmrwgl";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by rwxh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rwxh=rs.getInt("rwxh");
		rwbm=cf.fillNull(rs.getString("rwbm"));
		rwmc=cf.fillNull(rs.getString("rwmc"));

		jhkssj=rs.getDate("jhkssj");
		jhjssj=rs.getDate("jhjssj");
		jhgzr=rs.getInt("jhgzr");
		sjkssj=cf.fillHtml(rs.getDate("sjkssj"));
		sjjssj=cf.fillHtml(rs.getDate("sjjssj"));
		sjgzr=rs.getInt("sjgzr");

		row++;

		%>
		<tr align="center"  > 
		<td  rowspan="2"><%=row%></td>
		<td  rowspan="2"><%=rwmc%></td>
		<td  rowspan="2"><%=jhgzr%></td>
		<td  rowspan="2"><%=cf.fillHtml(jhkssj)%></td>
		<td  rowspan="2"><%=cf.fillHtml(jhjssj)%></td>
		<td  >计划</td>
		<%

		java.sql.Date rq=null;
		ls_sql="select rq";
		ls_sql+=" from  dm_gzrl";
		ls_sql+=" where rq>=? and rq<=?";
		if (jjrksg.equals("1"))//1：节、假日不可施工
		{
			ls_sql+=" and jjrbz='N'";
		}
		else if (jjrksg.equals("2"))//2：节日不可施工
		{
			ls_sql+=" and jjrlx not in('3','8')";//1：周六；2：周日；3：节日；8：其它；9：非节假日
		}
		ls_sql+=" order by rq";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,date1);
		ps1.setDate(2,date2);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			rq=rs1.getDate("rq");

			if (jhkssj==null || jhjssj==null)
			{
				%>
				<td>&nbsp</td>
				<%
			}
			else {
				if (rq.compareTo(jhkssj)>=0 && rq.compareTo(jhjssj)<=0)
				{
					%>
					<td><image src="/images/bar3.gif" height='6px' width='4px'></td>
					<%
				}
				else{
					%>
					<td>&nbsp</td>
					<%
				}
			}


		}
		rs1.close();
		ps1.close();

		%>
		</tr>
		<%

		%>
		<tr align="center"  > 
		<td  >实际</td>
		<%

		ls_sql="select nian,yue,ri";
		ls_sql+=" from  dm_gzrl";
		ls_sql+=" where rq>=? and rq<=?";
		if (jjrksg.equals("1"))//1：节、假日不可施工
		{
			ls_sql+=" and jjrbz='N'";
		}
		else if (jjrksg.equals("2"))//2：节日不可施工
		{
			ls_sql+=" and jjrlx not in('3','8')";//1：周六；2：周日；3：节日；8：其它；9：非节假日
		}
		ls_sql+=" order by nian,yue,ri";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,date1);
		ps1.setDate(2,date2);
		rs1 =ps1.executeQuery();
		while (rs1.next())
		{
			nian=rs1.getInt("nian");
			yue=rs1.getInt("yue");
			ri=rs1.getInt("ri");

			%>
			<td>&nbsp</td>
			<%
		}
		rs1.close();
		ps1.close();

		%>
		</tr>
		<%
		
		
	}
	rs.close();
	ps.close();


%>

  <div   id="a"   style="position:absolute;font-size:9pt;display:none;border:1px   solid   black;background:lightyellow">   </div>   
</table>
</td></tr>
 </table>
</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}

%>

<script>   

    
  //页面内元素的onmouseover事件的处理方法   

//document.onmousemove=function()
document.onmouseover=function()
{   
	if(event.srcElement.hint) 
	{   
		a.style.display="block";   
		a.innerHTML=event.srcElement.hint;   
		a.style.left=window.event.clientX+10;   
		a.style.top=window.event.clientY+10;   
		setTimeout("a.style.display='none'",800000);   
	}
	else{   
		a.style.display="none"   
	}   
} 

</script>   
