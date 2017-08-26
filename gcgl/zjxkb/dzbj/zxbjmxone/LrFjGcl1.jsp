<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String smbm=null;
String jldwbm=null;
double cldj=0;
double rgdj=0;
double dj=0;
String gycl=null;
String bz=null;
String bjlx=null;
String bjjb=null;
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String zjxxh=request.getParameter("zjxxh");

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xmmc,xmdlbm,xmxlbm,smbm,jldwmc,cldj,rgdj,dj,gycl,bz,DECODE(bjlx,'1','标准项目','2','自定义项目') bjlx,bjjbmc bjjb";
	ls_sql+=" from  bj_bjxmmxh,bdm_bjjbbm,jdm_jldwbm";
	ls_sql+=" where  dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and zjxxh='"+zjxxh+"' and bj_bjxmmxh.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ls_sql+=" and bj_bjxmmxh.jldwbm=jdm_jldwbm.jldwbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		smbm=cf.fillNull(rs.getString("smbm"));
		jldwbm=cf.fillNull(rs.getString("jldwmc"));
		cldj=rs.getDouble("cldj");
		rgdj=rs.getDouble("rgdj");
		dj=rs.getDouble("dj");
		bjjb=cf.fillNull(rs.getString("bjjb"));
		bjlx=cf.fillNull(rs.getString("bjlx"));

		gycl=cf.fillNull(rs.getString("gycl"));
		bz=cf.fillNull(rs.getString("bz"));

	}
	else{
		return;
	}
	rs.close();
	ps.close();
%>


<html>
<head>
<title>录入房间工程量明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<form method="post" action="SaveLrFjGcl1.jsp" name="editform" >
          
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
    <tr bgcolor="#FFFFFF"> 
      <td width="25%" align="right">项目编号</td>
      <td width="25%"><%=xmbh%></td>
      <td width="23%" align="right">级别</td>
      <td width="27%"><%=bjjb%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="25%" align="right">项目名称</td>
      <td colspan="3"><%=xmmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">材料单价</td>
      <td><%=cldj%></td>
      <td align="right">人工单价</td>
      <td><%=rgdj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="25%" align="right">计量单位</td>
      <td width="25%"><%=jldwbm%></td>
      <td width="23%" align="right">饰面</td>
      <td width="27%"><%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm where smbm='"+smbm+"'",smbm,true);
%></td>
    </tr>
	<tr bgcolor="#FFFFFF">
    <td colspan="4" > 
      <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="1">
        <%
			String jgwzbm=null;
			String jgwzmc=null;
			String slstr=null;
			double sl=0;

			int i1=0;
			int fjsl=0;
			String[] fjbm=null;
			String keystr=null;


			ls_sql="SELECT count(*)";
			ls_sql+=" FROM bj_fjxxh ";
			ls_sql+=" where zjxxh='"+zjxxh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				fjsl=rs.getInt(1);
				fjbm=new String [fjsl];
			}
			rs.close();
			ps.close();
			
			
			ls_sql="SELECT bj_fjxxh.jgwzbm,xuhao";
			ls_sql+=" FROM bj_fjxxh ";
			ls_sql+=" where zjxxh='"+zjxxh+"'";
			ls_sql+=" order by bj_fjxxh.xuhao ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				jgwzbm=rs.getString("xuhao");
				jgwzmc=rs.getString("jgwzbm");
				fjbm[i1]=jgwzbm;
				i1++;
			}
			rs.close();
			ps.close();

			
			i1=0;
			ls_sql="SELECT bj_fjxxh.jgwzbm,xuhao";
			ls_sql+=" FROM bj_fjxxh ";
			ls_sql+=" where zjxxh='"+zjxxh+"'";
			ls_sql+=" and jgwzbm in(select jgwzbm from bj_gclmxh where zjxxh='"+zjxxh+"' and  xmbh='"+xmbh+"') ";
			ls_sql+=" order by bj_fjxxh.xuhao ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				jgwzbm=rs.getString("xuhao");
				jgwzmc=rs.getString("jgwzbm");
				i1++;

				if (i1<fjbm.length)
				{
					keystr="C"+fjbm[i1];
				}
				else{
					keystr="savebutton";
				}

				sl=-1;
				ls_sql="SELECT sl";
				ls_sql+=" FROM bj_gclmxh ";
				ls_sql+=" where zjxxh='"+zjxxh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzmc+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery(ls_sql);
				if (rs1.next())
				{
					sl=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();

				if (sl==-1)
				{
					slstr="";
				}
				else{
					slstr=cf.doubleTrimStr(sl,2);
				}

				String xsmc=null;
				if (slstr.equals("0"))
				{
					xsmc=jgwzmc;
					slstr="";
				}
				else if (!slstr.equals(""))
				{
					xsmc="<font color='#FF0000'><B>"+jgwzmc+"</B></font>";
				}
				else{
					xsmc=jgwzmc;
					slstr="";
				}

				if (i1%2==1)//判断是否换行
				{
					%> </tr>
					<tr bgcolor="#FFFFFF"> 
					  <td width="16%" align="right"><%=xsmc%></td>
					  <td width="17%" bgcolor="#E8E8FF"> 
						<input type="text" name="C<%=jgwzbm%>" size="8" maxlength="8" value="<%=slstr%>" onKeyUp="keyGo(<%=keystr%>)">
						<input type="hidden" name="jgwzbm" value="<%=jgwzbm%>">					  
						<input type="hidden" name="CN<%=jgwzbm%>" value="<%=jgwzmc%>">					  
						
					</td>
					<%
				}
				else{
					%> 
					  <td width="16%" align="right"><%=xsmc%></td>
					  <td width="17%" bgcolor="#E8E8FF"> 
						<input type="text" name="C<%=jgwzbm%>" size="8" maxlength="8" value="<%=slstr%>" onKeyUp="keyGo(<%=keystr%>)">
						<input type="hidden" name="jgwzbm" value="<%=jgwzbm%>">					  
						<input type="hidden" name="CN<%=jgwzbm%>" value="<%=jgwzmc%>">					 
						
					</td>
					<%
				}
			}
			rs.close();
			ps.close();


			String styleStr=null;
			String buttonValue=null;
			if (i1==0)
			{
				styleStr="FONT-SIZE: 12px;display:block";
				buttonValue="隐藏房间";
			}
			else{
				styleStr="FONT-SIZE: 12px;display:none";
				buttonValue="增加新房间";
			}
%> 
      </table>


	   </td></tr>
       </table>
      <table width="100%" border="0" style='FONT-SIZE: 12px '   bgcolor="#E8E8FF" cellpadding="1" cellspacing="0">

   <tr> 
      <td colspan="4" >
        <div align="center"> 
          <input type="hidden" name="dqbm"  value="<%=dqbm%>" >
          <input type="hidden" name="xmbh"  value="<%=xmbh%>" >
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
          <input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
          <input type="button"  value="保存" onClick="f_do(editform)" name="savebutton">
          <input type="reset"  value="重输">
        </div>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td colspan="4"><HR><%=gycl%> </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td colspan="4"><HR><%=bz%> </td>
    </tr>
  </table>
</form>
</body>
</html>


<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	FormName.submit();
	return true;
}
function KeyDown()
{ 

	if ((event.ctrlKey))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
		alert('禁止拷贝') ;
	}

	if ((event.ctrlKey)&&(event.keyCode==78))
	{ //屏蔽 Ctrl+n
		event.returnValue=false;
	}
	if ((event.shiftKey)&&(event.keyCode==121))
	{ //屏蔽 shift+F10
		event.returnValue=false;
	}
}

//-->
</SCRIPT>
