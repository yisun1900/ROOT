<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
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

String ssfgs=null;
String dwbh=null;
String bjjb=null;
String jjrksg=null;
String jjrksgmc=null;
String fwdz=null;
String  gj=null;
String  dd=null;
String  sgd=null;
String  sgdmc="";
String sgbz=null;
String khxm=null;
String lxfs=null;
String kgrq=null;
String jgrq=null;
String sjs=null;

String sjsdh="";
String  gjdh="";
String  dddh="";
String  sgddh="";
String sgbzdh="";

String logo=null;

int width=10;

try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,dwbh,lxfs,bjjb,jjrksg,DECODE(jjrksg,'1','节、假日不可施工','2','节日不可施工','9','节、假日可施工') jjrksgmc,fwdz,gj,dd,sgd,sgbz,khxm,kgrq,jgrq,sjs";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		jjrksg=cf.fillNull(rs.getString("jjrksg"));
		jjrksgmc=cf.fillHtml(rs.getString("jjrksgmc"));

		fwdz=rs.getString("fwdz");
		gj=cf.fillHtml(rs.getString("gj"));
		dd=cf.fillHtml(rs.getString("dd"));
		sgd=cf.fillHtml(rs.getString("sgd"));
		sgbz=cf.fillHtml(rs.getString("sgbz"));
		khxm=rs.getString("khxm");
		kgrq=cf.fillHtml(rs.getDate("kgrq"));
		jgrq=cf.fillHtml(rs.getDate("jgrq"));
		sjs=rs.getString("sjs");
	}
	rs.close();
	ps.close();


	//设计师电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx,sq_sqbm";
	ls_sql+=" where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' and sq_yhxx.zwbm in('23','04') and yhmc ='"+sjs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sjsdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();


	//队长电话
	ls_sql=" select dh,sgdmc from sq_sgd";
	ls_sql+=" where sgd='"+sgd+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sgddh=cf.fillNull(rs.getString("dh"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
	}
	rs.close();
	ps.close();


	//班长电话
	ls_sql=" select dh from sq_bzxx";
	ls_sql+=" where sgd='"+sgd+"' and bzmc  ='"+sgbz+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sgbzdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//管家电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+gj+"' and zwbm='06'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		gjdh=cf.fillNull(rs.getString("dh"));
	}
	rs.close();
	ps.close();

	//调度电话
	ls_sql=" select dh ";
	ls_sql+=" from sq_yhxx";
	ls_sql+=" where ssfgs='"+ssfgs+"' and yhmc ='"+dd+"' and zwbm='07'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dddh=cf.fillNull(rs.getString("dh"));
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

	if (rqzl<10)
	{
		width=50;
	}
	else if (rqzl<20)
	{
		width=45;
	}
	else if (rqzl<30)
	{
		width=40;
	}
	else if (rqzl<40)
	{
		width=35;
	}
	else if (rqzl<50)
	{
		width=30;
	}
	else if (rqzl<60)
	{
		width=25;
	}
	else if (rqzl<70)
	{
		width=8;
	}
	else if (rqzl<80)
	{
		width=15;
	}
	else
	{
		width=30;
	}
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
   
	 <table  border="1" width="<%=(25+145+25+60+60+25+rqzl*(width+0))%>px" cellpadding="0" cellspacing="0" style='FONT-SIZE: 12px'>
	 <tr>
	   <td width="22%" rowspan="2" valign="middle">
	   <image src="/images/<%=logo%>" height='30px'> <span class="STYLE1">整体项目进度表</span></td>
	 
	     <td width="13%" >姓名:<%=khxm%></td>
		 <td colspan="2" >实际工期:<%=kgrq%>至<%=jgrq%></td>
		 <td width="12%" >家装设计师:<%=sjs%><%=sjsdh%></td>
		 <td width="12%" >橱/内设计师:</td>
		 <td width="12%" >卫浴设计师:</td>
		 <td width="12%" >家具设计师:</td>
	    </tr>
	   <tr >
	     <td colspan="2">地址:<%=fwdz%></td>
		 <td width="11%"><%=jjrksgmc%></td>
		 <td>项目管家:<%=gj%><%=gjdh%></td>
		 <td>大工长:<%=sgdmc%><%=sgddh%></td>
		 <td>现场责任人:<%=sgbz%><%=sgbzdh%></td>
		 <td>家装履约专员:<%=dd%><%=dddh%></td>
	    </tr>
	 </table>
   </td></tr>
  </div>
<tr><td width="100%">
  <table border="1" width="<%=(25+145+25+60+60+25+rqzl*(width+0))%>px" cellspacing="0" cellpadding="0"  style='FONT-SIZE:8px' >
    <tr  align="center" bgcolor="#FFFFCC"> 
		<td width="25px" rowspan="3">序号</td>
		
		<td width="145px" rowspan="3" >任务名称</td>
		<td width="25px" rowspan="3">工期</td>
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
			<td width="<%=width%>px"><%=ri%></td>
			<%
		}
		else if (ri<20)
		{
			%>
			<td width="<%=width%>px"><%=(ri-10)%></td>
			<%
		}
		else if (ri<30)
		{
			%>
			<td width="<%=width%>px"><%=(ri-20)%></td>
			<%
		}
		else{
			%>
			<td width="<%=width%>px"><%=(ri-30)%></td>
			<%
		}
	}
	rs.close();
	ps.close();


	%>
	</TR>

  </table>
  <table border="1" width="<%=(25+145+25+60+60+25+rqzl*(width+0))%>px" cellspacing="0" cellpadding="0"  style='FONT-SIZE:8px' >
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


		int start=0;
		ls_sql="select count(*)";
		ls_sql+=" from  dm_gzrl";
		ls_sql+=" where rq>=? and rq<?";
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
		ps1.setDate(2,jhkssj);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			start=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		int len=0;
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
		ls_sql+=" order by rq";
		ps1= conn.prepareStatement(ls_sql);
		ps1.setDate(1,jhkssj);
		ps1.setDate(2,jhjssj);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			len=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		%>
		<tr align="center"  > 
		<td  width="25px" rowspan="2"><%=row%></td>
		<td  width="145px" rowspan="2"><%=rwmc%></td>
		<td  width="25px" rowspan="2"><%=jhgzr%></td>
		<td  width="60px" rowspan="2"><%=cf.fillHtml(jhkssj)%></td>
		<td  width="60px" rowspan="2"><%=cf.fillHtml(jhjssj)%></td>
		<td  width="25px" >计划</td>
		<td align="left" valign="middle" colspan="<%=rqzl%>" width="<%=rqzl*(width+0)%>px">
			<%
			if (len==0)
			{
				%>
				&nbsp;
				<%
			}
			else{
				%>
				<image src="/images/bar3.gif" height='5px' border="0" width='<%=(start*(width+0))%>px'><image  border="0" src="/images/bar2.gif" height='5px' width='<%=(len*(width+0))%>px'>
				<%
			}
			%>
		</td>

		</tr>
		<%

		%>
		<tr align="center"  > 
		<td  >实际</td>
		<td align="left" colspan="<%=rqzl%>">&nbsp;</td>
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
