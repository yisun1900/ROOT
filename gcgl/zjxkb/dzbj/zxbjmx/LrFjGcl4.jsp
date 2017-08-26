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
double dj=0;
String gycl=null;
String bjlx=null;
String bjjb=null;
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
	ls_sql="select xmmc,xmdlbm,xmxlbm,smbm,jldwbm,dj,gycl,DECODE(bjlx,'1','标准项目','2','自定义项目') bjlx,bjjbmc bjjb,DECODE(bj_bjxmmxh.sfbxx,'1','必报项','2','必列项','3','可选项','9','作废项') sfbxx,zdyxmyxq";
	ls_sql+=" from  bj_bjxmmxh,bdm_bjjbbm";
	ls_sql+=" where  zjxxh='"+zjxxh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and khbh='"+khbh+"' and bj_bjxmmxh.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		smbm=cf.fillNull(rs.getString("smbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		dj=rs.getDouble("dj");
		bjjb=cf.fillNull(rs.getString("bjjb"));
		bjlx=cf.fillNull(rs.getString("bjlx"));

		gycl=cf.fillNull(rs.getString("gycl"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		zdyxmyxq=cf.fillHtml(rs.getDate("zdyxmyxq"));

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
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 录入房间工程量明细</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveLrFjGcl4.jsp" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">项目编号</div>
              </td>
              <td width="33%"> <%=xmbh%> </td>
              <td width="19%"> 
                <div align="right">项目名称;</div>
              </td>
              <td width="31%"><%=xmmc%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">项目大类</td>
              <td width="33%"> <%
	cf.selectItem(out,"select xmdlbm,xmdlmc from bdm_xmdlbm order by xmdlbm",xmdlbm,true);
%> </td>
              <td width="19%" align="right">项目小类</td>
              <td width="31%"> <%
	cf.selectItem(out,"select xmxlbm,xmxlmc from bdm_xmxlbm where xmdlbm='"+xmdlbm+"' order by xmdlbm,xmxlbm",xmxlbm,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">饰面</div>
              </td>
              <td width="33%"> <%
	cf.selectItem(out,"select smbm,smmc  from bdm_smbm order by smbm",smbm,true);
%> </td>
              <td width="19%"> 
                <div align="right">工程量计量单位</div>
              </td>
              <td width="31%"> <%
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm where jldwbm='"+jldwbm+"'",jldwbm,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">地区</td>
              <td width="33%"><%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm where dqbm='"+dqbm+"'",dqbm,true);
%></td>
              <td width="19%" align="right">标准单价</td>
              <td width="31%"><%=dj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">报价类型</div>
              </td>
              <td width="33%"><%=bjlx%> </td>
              <td width="19%"> 
                <div align="right">报价级别</div>
              </td>
              <td width="31%"><%=bjjb%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">是否必选项</div>
              </td>
              <td width="33%"><%=sfbxx%> </td>
              <td width="19%"> 
                <div align="right">项目有效期</div>
              </td>
              <td width="31%"><%=zdyxmyxq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">工艺材料</td>
              <td colspan="3"> <%=gycl%> </td>
            </tr>
            <tr > 
              <td colspan="4" > 
                <div align="center">房间工程量</div>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4" > 
                <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
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
				ls_sql+=" where zjxxh='"+zjxxh+"' and khbh='"+khbh+"' and xmbh='"+xmbh+"' and dqbm='"+dqbm+"' and jgwzbm='"+jgwzmc+"'";
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
					xsmc="<font color='#0000CC'><B>"+jgwzmc+"</B></font>";
				}
				else if (!slstr.equals(""))
				{
					xsmc="<font color='#FF0000'><B>"+jgwzmc+"</B></font>";
				}
				else{
					xsmc=jgwzmc;
				}

				if (i1%3==1)
				{
					%> 
					  </tr>
					  <tr bgcolor="#FFFFFF"> 
						<td width="16%" align="right"><%=xsmc%></td>
						<td width="17%" bgcolor="#E8E8FF"> 
						<input type="text" name="C<%=jgwzbm%>" size="8" maxlength="8" value="<%=slstr%>" onKeyUp="keyGo(<%=keystr%>)">
						<input type="hidden" name="CN<%=jgwzbm%>" value="<%=jgwzmc%>">
						</td>
					  <%
				}
				else{
					%> 
						<td width="16%" align="right"><%=xsmc%></td>
						<td width="17%" bgcolor="#E8E8FF"> 
						<input type="text" name="C<%=jgwzbm%>" size="8" maxlength="8" value="<%=slstr%>" onKeyUp="keyGo(<%=keystr%>)">
						<input type="hidden" name="CN<%=jgwzbm%>" value="<%=jgwzmc%>">
						</td>
					  <%
				}
			}
			rs.close();
			ps.close();
			while (true)
			{
				i1++;
				if (i1%3==1)
				{
					break;
				}
				else{
					%> 
						<td width="16%" align="right">&nbsp;</td>
						<td width="17%" bgcolor="#E8E8FF"> &nbsp;</td>
					  <%
				}
			}

%> 
                </table>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(editform)" name="savebutton">
                  <input type="reset"  value="重输">
				<input type="hidden" name="dqbm"  value="<%=dqbm%>" >
				<input type="hidden" name="xmbh"  value="<%=xmbh%>" >
				<input type="hidden" name="khbh"  value="<%=khbh%>" >
            <input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
                </div>
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
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
