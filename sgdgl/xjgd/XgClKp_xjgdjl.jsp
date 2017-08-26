<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String xjjlh=null;
String khbh=null;
String xjr=null;
String xjsj=null;
String xjlxbm=null;
String xjjgbm=null;
double fkze=0;
double kfzs=0;
double kcjdebl=0;
String lrr=null;
String lrsj=null;
String bz=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String sjkgrq=null;
String sjs=null;
String sgd=null;
String zjxm=null;
String sgbz=null;
String jsr=null;
String jssj=null;
String jsyj=null;
String jhjjsj=null;

String clr=null;
String clsj=null;
String clyj=null;


String wherexjjlh=cf.GB2Uni(request.getParameter("xjjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select xjjlh,khbh,xjr,xjsj,xjlxbm,xjjgbm,fkze,kcjdebl,kfzs,kcjdebl,lrr,lrsj,kp_xjgdjl.bz ,sgdmc,jsr,jssj,jsyj,jhjjsj,clr,clsj,clyj";
	ls_sql+=" from  kp_xjgdjl,sq_sgd";
	ls_sql+=" where kp_xjgdjl.sgd=sq_sgd.sgd(+) and  (xjjlh='"+wherexjjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jsr=cf.fillNull(rs.getString("jsr"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		jsyj=cf.fillNull(rs.getString("jsyj"));
		jhjjsj=cf.fillNull(rs.getDate("jhjjsj"));
		clr=cf.fillNull(rs.getString("clr"));
		clsj=cf.fillNull(rs.getDate("clsj"));
		clyj=cf.fillNull(rs.getString("clyj"));
		xjjlh=cf.fillNull(rs.getString("xjjlh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		xjr=cf.fillNull(rs.getString("xjr"));
		xjsj=cf.fillNull(rs.getDate("xjsj"));
		xjlxbm=cf.fillNull(rs.getString("xjlxbm"));
		xjjgbm=cf.fillNull(rs.getString("xjjgbm"));
		fkze=rs.getDouble("fkze");
		kfzs=rs.getDouble("kfzs");
		kcjdebl=rs.getDouble("kcjdebl");
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
		sgd=cf.fillNull(rs.getString("sgdmc"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,sjkgrq,sjs,zjxm,sgbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=rs.getString("khxm");
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
	}
	rs.close();
	ps.close();

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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">施工队检查--问题接收（检查记录号：<%=xjjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveClKp_xjgdjl.jsp" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#000099">客户编号</font></div>
              </td>
              <td width="35%"><%=khbh%> </td>
              <td width="15%"> 
                <div align="right"><font color="#000099">实开工日期</font></div>
              </td>
              <td width="35%"><%=sjkgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#000099">客户姓名</font></td>
              <td width="35%"><%=khxm%></td>
              <td width="15%" align="right"><font color="#000099">联系方式</font></td>
              <td width="35%"><%=lxfs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#000099">房屋地址</font></td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#000099">设计师</font></td>
              <td width="35%"><%=sjs%></td>
              <td width="15%" align="right"><font color="#000099">施工队</font></td>
              <td width="35%"><%=sgd%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#000099">质检姓名</font></td>
              <td width="35%"><%=zjxm%></td>
              <td width="15%" align="right"><font color="#000099">施工班组</font></td>
              <td width="35%"><%=sgbz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">检查人</div>
              </td>
              <td width="35%"> <%=xjr%> </td>
              <td width="15%"> 
                <div align="right">检查时间</div>
              </td>
              <td width="35%"> <%=xjsj%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">检查类型</div>
              </td>
              <td width="35%"> <%
	cf.selectItem(out,"select xjlxbm,xjlxmc from kp_xjlxbm order by xjlxbm",xjlxbm,true);
%> </td>
              <td width="15%"> 
                <div align="right">检查结果</div>
              </td>
              <td width="35%"><%
	cf.selectItem(out,"select xjjgbm,xjjgmc from dm_xjjgbm order by xjjgbm",xjjgbm,true);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">罚款总额</td>
              <td><%=fkze%></td>
              <td align="right">扣分总数</td>
              <td><%=kfzs%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="15%" align="right">扣除接单额百分比</td>
              <td width="35%"><%=kcjdebl%>%</td>
              <td width="15%">&nbsp;</td>
              <td width="35%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">录入人</div>
              </td>
              <td width="35%"> <%=lrr%> </td>
              <td width="15%"> 
                <div align="right">录入时间</div>
              </td>
              <td width="35%"> <%=lrsj%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">备注</td>
              <td colspan="3"> <%=bz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td><div align="right">接收人</div></td>
              <td><%=jsr%></td>
              <td><div align="right">接收时间</div></td>
              <td><%=jssj%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td><div align="right">计划解决时间</div></td>
              <td><%=jhjjsj%></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td><div align="right">接收说明</div></td>
              <td colspan="3"><%=jsyj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">处理人</div>
              </td>
              <td width="35%"> 
                <input type="text" name="clr" size="20" maxlength="20"  value="<%=clr%>" >
              </td>
              <td width="15%"> 
                <div align="right">处理时间</div>
              </td>
              <td width="35%"> 
                <input type="text" name="clsj" size="20" maxlength="10"  value="<%=clsj%>"  onDblClick="JSCalendar(this)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">处理说明</td>
              <td colspan="3"> 
                <textarea name="clyj" cols="71" rows="3"><%=clyj%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherexjjlh"  value="<%=wherexjjlh%>" >
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                </div>
              </td>
            </tr>
          </table>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="13%">项目大类</td>
	<td  width="15%">检查项目</td>
	<td  width="8%">违规分级</td>
	<td  width="7%">单次扣分</td>
	<td  width="8%">单次罚款</td>
	<td  width="7%">扣除接单额百分比</td>
	<td  width="14%">其它处罚</td>
	<td  width="7%">违章次数</td>
	<td  width="21%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();


	ls_sql="SELECT kp_kpdlbm.kpdlmc,kp_gckpxm.kpxmmc,ydcdmc,kp_xjgdmx.kf,kp_xjgdmx.sgdfk,kp_xjgdmx.kcjdebl||'%',kp_kpcfbm.kpcfmc as kp_kpcfbm_kpcfmc,wzcs,kp_xjgdmx.bz  ";
	ls_sql+=" FROM kp_xjgdmx,kp_gckpxm,kp_kpdlbm,kp_kpcfbm,kp_sgdyzcdbm  ";
    ls_sql+=" where kp_xjgdmx.kpxmbm=kp_gckpxm.kpxmbm and kp_xjgdmx.kpjg=kp_gckpxm.kpjg and kp_gckpxm.kpdlbm=kp_kpdlbm.kpdlbm";
    ls_sql+=" and kp_xjgdmx.kpcfbm=kp_kpcfbm.kpcfbm(+) ";
    ls_sql+=" and kp_xjgdmx.kpjg=kp_sgdyzcdbm.yzcdbm(+) and kp_xjgdmx.xjjlh='"+xjjlh+"'";
    ls_sql+=" order by kp_gckpxm.kpdlbm,kp_xjgdmx.kpxmbm,kp_xjgdmx.kpjg";
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数

//设置显示合并列

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();
%> 
</table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.clr)=="") {
		alert("请输入[处理人]！");
		FormName.clr.focus();
		return false;
	}
	if(	javaTrim(FormName.clsj)=="") {
		alert("请输入[处理时间]！");
		FormName.clsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.clsj, "处理时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
