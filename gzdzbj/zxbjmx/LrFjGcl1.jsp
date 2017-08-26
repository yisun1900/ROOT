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
String bjlxmc=null;
String bjjb=null;
String sfxycl=null;

String zcjldwbm="";
String zcmc="";
String zcgg="";
String yzcmc="";
String yzcgg="";
double zcyl=0;
double zcf=0;
double yzcf=0;
String zcylstr="";
String zcfstr="";
double fcf=0;
double rgf=0;
double jjf=0;
double glfbl=0;


String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select sfxycl,zcmc,zcgg,zcf,fcf,rgf,jjf,glfbl,xmmc,xmdlbm,xmxlbm,smbm,jldwbm,dj,gycl,bjlx,DECODE(bjlx,'1','标准项目','2','自定义项目') bjlxmc,bjjbmc bjjb";
	ls_sql+=" from  bj_bjxmmx,bdm_bjjbbm";
	ls_sql+=" where  dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and khbh='"+khbh+"' and bj_bjxmmx.bjjb=bdm_bjjbbm.bjjbbm(+)";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		sfxycl=cf.fillNull(rs.getString("sfxycl"));
		xmmc=cf.fillNull(rs.getString("xmmc"));
		xmdlbm=cf.fillNull(rs.getString("xmdlbm"));
		xmxlbm=cf.fillNull(rs.getString("xmxlbm"));
		smbm=cf.fillNull(rs.getString("smbm"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		dj=rs.getDouble("dj");
		bjjb=cf.fillNull(rs.getString("bjjb"));
		bjlx=cf.fillNull(rs.getString("bjlx"));
		bjlxmc=cf.fillNull(rs.getString("bjlxmc"));

		gycl=cf.fillNull(rs.getString("gycl"));

		yzcmc=cf.fillNull(rs.getString("zcmc"));
		yzcgg=cf.fillNull(rs.getString("zcgg"));
		yzcf=rs.getDouble("zcf");
		fcf=rs.getDouble("fcf");
		rgf=rs.getDouble("rgf");
		jjf=rs.getDouble("jjf");
		glfbl=rs.getDouble("glfbl");
	}
	rs.close();
	ps.close();

	double xjqye=0;//总额
	if (bjlx.equals("1"))//1:标准项目;2:自定义项目
	{
		//标准项目：公式计算
		if (sfxycl.equals("1"))//1：需要；2：不需要
		{
			ls_sql="SELECT sum(bj_gclmx.sl*(bj_dwgclzcyl.zcf+bj_bjxmmx.fcf+bj_bjxmmx.rgf+bj_bjxmmx.jjf)*((100+bj_bjxmmx.glfbl)/100))";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx,bj_dwgclzcyl";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"' and bj_bjxmmx.dqbm='"+dqbm+"' and bj_bjxmmx.xmbh='"+xmbh+"'";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and bj_gclmx.khbh=bj_dwgclzcyl.khbh and bj_gclmx.dqbm=bj_dwgclzcyl.dqbm and bj_gclmx.xmbh=bj_dwgclzcyl.xmbh and bj_gclmx.jgwzbm=bj_dwgclzcyl.jgwzbm";
			ls_sql+=" and bj_bjxmmx.bjlx='1'";//1:标准项目;2:自定义项目
			ls_sql+=" and bj_bjxmmx.sfxycl='1'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				xjqye=rs.getDouble(1);
			}
			rs.close();
			ps.close();
		}
		else{
			ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
			ls_sql+=" FROM bj_bjxmmx,bj_gclmx";
			ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"' and bj_bjxmmx.dqbm='"+dqbm+"' and bj_bjxmmx.xmbh='"+xmbh+"'";
			ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
			ls_sql+=" and bj_bjxmmx.bjlx='1'";//1:标准项目;2:自定义项目
			ls_sql+=" and bj_bjxmmx.sfxycl='2'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				xjqye=rs.getDouble(1);
			}
			rs.close();
			ps.close();
		}
	}
	else{
		//自定义项目：直接取
		ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.dj)";
		ls_sql+=" FROM bj_bjxmmx,bj_gclmx";
		ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"' and bj_bjxmmx.dqbm='"+dqbm+"' and bj_bjxmmx.xmbh='"+xmbh+"'";
		ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
		ls_sql+=" and bj_bjxmmx.bjlx='2'";//1:标准项目;2:自定义项目
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			xjqye=rs.getDouble(1);
		}
		rs.close();
		ps.close();
	}


%>


<html>
<head>
<title>录入房间工程量明细</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
</head>

<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px;' >
<noscript><iframe scr="*.htm"></iframe></noscript>
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">录入房间工程量明细<B>(该项总计：<%=cf.formatDouble(xjqye)%>元)</B></div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveLrFjGcl1.jsp" name="editform" >
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
	cf.selectItem(out,"select jldwbm,jldwmc from jdm_jldwbm order by jldwbm",jldwbm,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">地区</td>
              <td width="33%"><%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm,true);
%></td>
              <td width="19%" align="right">标准单价</td>
              <td width="31%"><%=dj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">报价类型</div>
              </td>
              <td width="33%"><%=bjlxmc%> </td>
              <td width="19%"> 
                <div align="right">报价级别</div>
              </td>
              <td width="31%"><%=bjjb%> </td>
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
				<tr bgcolor="#CCCCCC"  align="center"> 
					<td width="4%">序号</td>
					<td width="8%">房间名称</td>
					<td width="6%">工程量</td>
					<td width="14%">主材名称</td>
					<td width="14%">主材规格</td>
					<td width="5%">主材计量单位</td>
					<td width="6%"><b><font color="#FF0000">单位工程量</font></b><BR>的主材用量</td>
					<td width="6%"><b><font color="#FF0000">单位工程量</font></b><BR>的主材费</td>
					<td width="6%">综合单价</td>
				</tr>
                  <%
			String bgcolor=null;
			String jgwzbm=null;
			String jgwzmc=null;
			String slstr=null;
			double sl=0;

			int row=0;
			int fjsl=0;
			String[] fjbm=null;
			String keystr=null;

			ls_sql="SELECT count(*)";
			ls_sql+=" FROM bj_fjxx ";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			if (rs.next())
			{
				fjsl=rs.getInt(1);
				fjbm=new String [fjsl];
			}
			rs.close();
			ps.close();
			
			
			ls_sql="SELECT bj_fjxx.jgwzbm,xuhao";
			ls_sql+=" FROM bj_fjxx ";
			ls_sql+=" where khbh='"+khbh+"'";
			ls_sql+=" order by bj_fjxx.xuhao ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				jgwzbm=rs.getString("xuhao");
				jgwzmc=rs.getString("jgwzbm");
				fjbm[row]=jgwzbm;
				row++;
			}
			rs.close();
			ps.close();

			
			row=0;
			ls_sql="SELECT bj_fjxx.jgwzbm,xuhao";
			ls_sql+=" FROM bj_fjxx ";
			ls_sql+=" where khbh='"+khbh+"'";
			ls_sql+=" order by bj_fjxx.xuhao ";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery(ls_sql);
			while (rs.next())
			{
				jgwzbm=rs.getString("xuhao");
				jgwzmc=rs.getString("jgwzbm");
				row++;

				if (row<fjbm.length)
				{
					keystr="C"+fjbm[row];
				}
				else{
					keystr="savebutton";
				}

				sl=-1;
				ls_sql="SELECT sl";
				ls_sql+=" FROM bj_gclmx ";
				ls_sql+=" where khbh='"+khbh+"' and dqbm='"+dqbm+"' and xmbh='"+xmbh+"' and jgwzbm='"+jgwzmc+"'";
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

				//单位工程量主材用量

				zcylstr="";

				if (yzcf!=0)
				{
					zcfstr=yzcf+"";
				}
				else{
					zcfstr="";
				}

				zcf=yzcf;
				zcmc=yzcmc;
				zcgg=yzcgg;
				zcjldwbm="";

				ls_sql="SELECT zcmc,zcgg,zcyl,zcf,zcjldwbm";
				ls_sql+=" FROM bj_dwgclzcyl ";
				ls_sql+=" where bj_dwgclzcyl.khbh='"+khbh+"' and bj_dwgclzcyl.dqbm='"+dqbm+"' and bj_dwgclzcyl.xmbh='"+xmbh+"' and bj_dwgclzcyl.jgwzbm='"+jgwzmc+"'";
				ps1= conn.prepareStatement(ls_sql);
				rs1 =ps1.executeQuery();
				if (rs1.next())
				{
					zcmc=cf.fillNull(rs1.getString("zcmc"));
					zcgg=cf.fillNull(rs1.getString("zcgg"));
					zcjldwbm=cf.fillNull(rs1.getString("zcjldwbm"));
					zcyl=rs1.getDouble("zcyl");
					zcf=rs1.getDouble("zcf");

					zcylstr=zcyl+"";
					zcfstr=zcf+"";
				}
				rs1.close();
				ps1.close();

				if (zcylstr.equals(""))
				{
					zcfstr="";
				}

				if (bjlx.equals("1"))//1:标准项目;2:自定义项目
				{
					if (sfxycl.equals("1"))//1：需要；2：不需要
					{
						dj=(zcf+fcf+rgf+jjf)*(100+glfbl)/100;
					}
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

				if (row%2==0)
				{
					bgcolor="#E8E8FF";
				}
				else{
					bgcolor="#FFFFFF";
				}


				%> 
				  <tr bgcolor="<%=bgcolor%>" align="center"> 
					<td ><%=row%></td>
					<td ><%=xsmc%>
						<input type="hidden" name="jgwzbm" value="<%=jgwzbm%>">
						<input type="hidden" name="jgwzmc" value="<%=jgwzmc%>">
					</td>
<%
					if (sfxycl.equals("1"))//1：需要；2：不需要
					{
						%>
						<td > 
							<input type="text" name="sl" size="8" maxlength="8" value="<%=slstr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcmc[<%=(row-1)%>])">
						</td>
						<td > 
							<input type="text" name="zcmc" size="22" maxlength="50" value="<%=zcmc%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcgg[<%=(row-1)%>])">
						</td>
						<td > 
							<input type="text" name="zcgg" size="22" maxlength="50" value="<%=zcgg%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcyl[<%=(row-1)%>])">
						</td>
						<td >
						<select name="zcjldwbm" style="FONT-SIZE:12PX;WIDTH:52PX">
						  <option value=""></option>
						  <%
							cf.selectItem(out,"select cljldwmc c1,cljldwmc c2 from bdm_cljldwbm order by cljldwbm",zcjldwbm);
							%> 
						</select>
						</td>
						<td > 
							<input type="text" name="zcyl" size="8" maxlength="8" value="<%=zcylstr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(zcf[<%=(row-1)%>])">
						</td>
						<td > 
							<input type="text" name="zcf" size="8" maxlength="8" value="<%=zcfstr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[<%=row%>])">
						</td>
						<td><%=cf.formatDouble(dj)%></td>
						<%
					}
					else{
						%>
						<td > 
							<input type="text" name="sl" size="8" maxlength="8" value="<%=slstr%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[<%=(row)%>])">
						</td>
						<td >&nbsp;</td>
						<td >&nbsp;</td>
						<td >&nbsp;</td>
						<td >&nbsp;</td>
						<td >&nbsp;</td>
						<td >&nbsp;</td>
						<%
					}
%>
				  </tr>
				  <%
			}
			rs.close();
			ps.close();

%> 
                </table>
              </td>
            </tr>
            <input type="hidden" name="sfxycl"  value="<%=sfxycl%>" >
            <input type="hidden" name="dqbm"  value="<%=dqbm%>" >
            <input type="hidden" name="xmbh"  value="<%=xmbh%>" >
            <input type="hidden" name="khbh"  value="<%=khbh%>" >
            <tr> 
              <td colspan="4" height="2">
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(editform)" name="savebutton">
                  <input type="reset"  value="重输">
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
