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
double zqdj=0;
double cldj=0;
double rgdj=0;
double jxdj=0;
double zcf=0;
double shf=0;
double ysf=0;
double qtf=0;
String gycl=null;
String flmcgg=null;
String bz=null;
String bjlx=null;
String bjjb=null;
String glxmbh=null;
String sfbxx=null;
String zdyxmyxq=null;
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

	ls_sql="select zcf,shf,ysf,qtf,cldj,rgdj,jxdj,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,zqdj,gycl,DECODE(bjlx,'1','标准项目','2','自定义项目') bjlx,bjjbmc bjjb,glxmbh,DECODE(bj_bjxmmxh.sfbxx,'1','必报项','2','必列项','3','可选项','4','自定义','9','作废项') sfbxx,zdyxmyxq,flmcgg,bz";
	ls_sql+=" from  bj_bjxmmxh,bdm_bjjbbm";
	ls_sql+=" where zjxxh='"+zjxxh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and khbh='"+khbh+"' and bj_bjxmmxh.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		zcf=rs.getDouble("zcf");
		shf=rs.getDouble("shf");
		ysf=rs.getDouble("ysf");
		qtf=rs.getDouble("qtf");
		cldj=rs.getDouble("cldj");
		rgdj=rs.getDouble("rgdj");
		jxdj=rs.getDouble("jxdj");
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		smbm=cf.fillNull(rs.getString("smbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		zqdj=rs.getDouble("zqdj");
		bjjb=cf.fillNull(rs.getString("bjjb"));
		bjlx=cf.fillNull(rs.getString("bjlx"));

		gycl=cf.fillNull(rs.getString("gycl"));
		glxmbh=cf.fillNull(rs.getString("glxmbh"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		zdyxmyxq=cf.fillNull(rs.getDate("zdyxmyxq"));
		flmcgg=cf.fillNull(rs.getString("flmcgg"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	else{
		rs.close();
		ps.close();
		return;
	}
	rs.close();
	ps.close();

%>


<html>
<head>
<title>录入房间工程量明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' onKeyDown="KeyDown()" scroll=auto oncontextmenu="window.event.returnValue=false" onselectstart="return false;">
<noscript><iframe scr="*.htm"></iframe></noscript>
<form method="post" action="SaveLrFjGcl1.jsp" name="editform" >
  <div align="center"><B><font color="#FF0000">增减工程量，减项为负数</font></B>         
  </div>
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
      <td width="25%" align="right">关联项目编号</td>
      <td colspan="3"><%=glxmbh%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">辅材费</td>
      <td><%=cldj%></td>
      <td align="right">主材费</td>
      <td><%=zcf%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">人工费</td>
      <td><%=rgdj%></td>
      <td align="right">运输费</td>
      <td><%=ysf%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">机械费</td>
      <td><%=jxdj%></td>
      <td align="right">损耗费</td>
      <td><%=shf%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right">其它费</td>
      <td><%=qtf%></td>
      <td align="right">工程预算价</td>
      <td><%=zqdj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="25%" align="right">饰面</td>
      <td colspan="3"><%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm where smbm='"+smbm+"'",smbm,true);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="25%" align="right">是否必选项</td>
      <td width="25%"><%=sfbxx%></td>
      <td width="23%" align="right">项目有效期</td>
      <td width="27%"><%=zdyxmyxq%></td>
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
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
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
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
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
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
			ls_sql+=" and jgwzbm in(select jgwzbm from bj_gclmxh where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and  xmbh='"+xmbh+"') ";
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

				sl=0;
				ls_sql="SELECT sl";
				ls_sql+=" FROM bj_gclmxh ";
				ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzmc+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					sl=rs1.getDouble(1);
				}
				rs1.close();
				ps1.close();

				double zjqsl=0;
				ls_sql="SELECT sl";
				ls_sql+=" from  bj_gclmxq";
				ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzmc+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					zjqsl=rs1.getDouble("sl");
				}
				rs1.close();
				ps1.close();

				double zjsl=sl-zjqsl;
				zjsl=cf.round(zjsl,2);

				slstr=zjsl+"";

				if (slstr.endsWith(".0"))
				{
					slstr=slstr.substring(0,slstr.length()-2);
				}

				String zjqslStr=zjqsl+"";
				if (zjqslStr.endsWith(".0"))
				{
					zjqslStr=zjqslStr.substring(0,zjqslStr.length()-2);
				}


				String xsmc=null;
				if (slstr.equals("0"))
				{
					xsmc="<font color='#0000CC'><B>"+jgwzmc+"</B></font>";
					slstr="";
				}
				else if (!slstr.equals(""))
				{
					xsmc="<font color='#FF0000'><B>"+jgwzmc+"</B></font>";
				}
				else{
					xsmc=jgwzmc;
				}


				%> 
				<tr bgcolor="#FFFFFF"> 
				  <td width="16%" align="right"><%=xsmc%></td>
				  <td width="17%" bgcolor="#E8E8FF"> 
					<input name="CL<%=jgwzbm%>" type="hidden" value="<%=zjqsl%>">
					<input type="text" name="C<%=jgwzbm%>" size="8" maxlength="8" value="<%=slstr%>" onFocus="if (<%=slstr%>==0 && parseInt(this.value)==0) this.value='';" onBlur="if (<%=slstr%>==0 && this.value=='') this.value='0'" onKeyUp="keyGo(<%=keystr%>)">
					<input type="hidden" name="CN<%=jgwzbm%>" value="<%=jgwzmc%>">					  
				  </td>
				  <td width="16%" align="right">原工程量</td>
				  <td width="17%" bgcolor="#E8E8FF"><%=zjqsl%></td>
				</tr>
				<%

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

      <table width="100%" border="0" style='<%=styleStr%>'  id="id1" bgcolor="#999999" cellpadding="1" cellspacing="1">
<%
			i1=0;
			ls_sql="SELECT bj_fjxxh.jgwzbm,xuhao";
			ls_sql+=" FROM bj_fjxxh ";
			ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"'";
			ls_sql+=" and jgwzbm not in(select jgwzbm from bj_gclmxh where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and  xmbh='"+xmbh+"') ";
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


				slstr="";
				String xsmc=null;
				xsmc=jgwzmc;



				%> 
				<tr bgcolor="#FFFFFF"> 
				  <td width="16%" align="right"><%=xsmc%></td>
				  <td width="17%" bgcolor="#E8E8FF"> 
					<input name="CL<%=jgwzbm%>" type="hidden" value="0">
					<input type="text" name="C<%=jgwzbm%>" size="8" maxlength="8" value="<%=slstr%>" onKeyUp="keyGo(<%=keystr%>)">
					<input type="hidden" name="CN<%=jgwzbm%>" value="<%=jgwzmc%>">					 
				</td>
			  <td width="16%" align="right">&nbsp;</td>
			  <td width="17%" bgcolor="#E8E8FF">&nbsp;</td>
				</tr>
				<%

			}
			rs.close();
			ps.close();
%> 
      </table>    </td></tr>
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
		  <input type="button"  value="<%=buttonValue%>" name="button1" onClick="if (button1.value=='增加新房间') { id1.style.display='block';button1.value='隐藏房间'; } else { id1.style.display='none';button1.value='增加新房间'; }">
          <input type="reset"  value="重输">
        </div>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td colspan="4"><%=gycl%> </td>
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
