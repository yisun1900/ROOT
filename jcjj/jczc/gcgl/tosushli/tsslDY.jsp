<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String slfsbm=null;
String yzcdbm=null;
String yqjjsj=null;
String sfxhf=null;
String hfsj=null;
String hfjlh=null;
String zxhfsj=null;
String hfr=null;
String slsj=null;
String slr=null;
String slbm=null;
String clzt=null;
String zrbmclzt=null;
String jasj=null;
String wxsgd=null;
String lx=null;
String djbh=null;
String hfdjbz=null;
String tspp=null;
String djsj=null;
String djr=null;
String jhjdsj=null;
String sjjdsj=null;
String jdr=null;
String bz=null;
String tsnr=null;
String sftsqk=null;

double wxrgf=0;
double wxcf=0;
double wxclf=0;
double wxzfy=0;
double zrfcdfy=0;
double sqyzfy=0;
double gscdfy=0;
double qtfcdfy=0;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;

String dwmc=null;
String dwbh=null;
String clqk=null;
String zjxm=null;

String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();

	ls_sql="SELECT crm_khxx.hth,crm_khxx.khbh,crm_khxx.khxm,lxfs,crm_khxx.fwdz,crm_khxx.sjs,sgdmc sgd,crm_khxx.zjxm,crm_tsjl.tsjlh,DECODE(crm_tsjl.sftsqk,'Y','特殊','N','否') sftsqk,slfsmc,yzcdmc,crm_tsjl.tsnr,crm_tsjl.yqjjsj, DECODE(crm_tsjl.sfxhf,'Y','需回访','N','不需回访') sfxhf,to_char(crm_tsjl.slsj,'YYYY-MM-DD') slsj, DECODE(crm_tsjl.clzt,'0','非客服登记','1','客服受理','2','在处理','3','结案','9','不立案') jazt,tsxlmc,tsyymc,b.dwmc zrbm,b.dwbh, DECODE(crm_tsbm.clzt,'0','未通知','1','已通知未处理','2','在处理','3','已解决') clzt,crm_tsbm.lrr,crm_tsbm.lrsj,hfjgmc,'（'||TO_CHAR(crm_tsbm.clsj,'YYYY-MM-DD')||'，'||crm_tsbm.clr||'）：'||crm_tsbm.clqk clqk,gysmc tspp  ";
	ls_sql+=" FROM crm_khxx,crm_tsbm,crm_tsjl,crm_tspp,dm_tsxlbm,dm_tsyybm,dm_slfsbm,dm_yzcdbm,sq_sgd,sq_dwxx b,sq_gysxx c,dm_hfjgbm ";
    ls_sql+=" where crm_tsjl.tsjlh=crm_tsbm.tsjlh(+) and crm_tsbm.tsjlh=crm_tspp.tsjlh(+) and crm_tsbm.tsyybm=crm_tspp.tsyybm(+) ";
    ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh and crm_tsbm.hfjgbm=dm_hfjgbm.hfjgbm(+)";
    ls_sql+=" and crm_tsbm.tsyybm=dm_tsyybm.tsyybm(+) and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+)";
    ls_sql+=" and crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) and crm_tsjl.yzcdbm=dm_yzcdbm.yzcdbm(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_tsbm.dwbh=b.dwbh(+) and crm_tspp.tspp=c.gysbh(+) and crm_tsjl.tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		khbh=cf.fillNull(rs.getString("khbh"));
		slsj=cf.fillNull(rs.getString("slsj"));
		tspp=cf.fillNull(rs.getDate("tspp"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		clqk=cf.fillNull(rs.getString("clqk"));
		tsnr=cf.fillNull(rs.getString("tsnr"));

	}
	rs.close();
	ps.close();
	
	ls_sql="select b.dwmc ";
	ls_sql+=" from  sq_dwxx a,sq_dwxx b";
	ls_sql+=" where a.ssdw=b.dwbh and a.dwbh='"+dwbh+"' ";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();

%>

<html>
<head>
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<div align="center"></div>
<table width="100%" height="593" border="0"  bgcolor="#FFFFFF" >
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6"><div align="center"><strong>投诉受理单</strong></div></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2">&nbsp;</td>
    <td>&nbsp;</td>
    <td width="21%"><div align="right"></div></td>
    <td width="31%"><div align="right">编号:<%=tsjlh%></div></td>
    <td width="1%">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="8%"> <div align="left">投诉日期:</div></td>
    <td width="11%"><%=slsj%></td>
    <td width="28%">&nbsp; </td>
    <td colspan="2"> <div align="left">所属分公司:<%=dwmc%></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td height="21" colspan="3" align="right"> <div align="left">客户姓名:<%=khxm%></div></td>
    <td colspan="2"><div align="left">联系方式:<%=lxfs%></div></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="3" align="right"> <div align="left">客户地址:<%=fwdz%></div>
      <div align="left"></div></td>
    <td colspan="2"><div align="right"></div></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="5" align="right"> <div align="left">投诉事项:<%=tspp%><%=tsnr%></div>
      <div align="left"></div></td>
    <td align="right">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td colspan="2">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="right">&nbsp;</td>
    <td><div align="right">电话投诉</div></td>
    <td colspan="2"> <div align="center">接手客服专员签名：</div></td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td height="22" colspan="6" align="right"> <div align="left"><em>以下内容为分公司及客户填写：</em></div></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" rowspan="" align="right"><div align="left">投诉解决方案及结果：</div></td>
    <td colspan="3"><%=clqk%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="right">&nbsp;</td>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td colspan="2"><div align="center">确认人：</div></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="right">&nbsp;</td>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="right">&nbsp;</td>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="right"><div align="left">客户意见：</div></td>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td colspan="2"><div align="center">客户签名:</div>
      <div align="right"></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" align="right"><div align="left"><em>以下内容为总部客服中心填写:</em></div></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="right"><div align="left">总部跟踪回访:</div></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="6" align="right"><div align="left">1.受理单回传日期:</div></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="right"><div align="left">2.客户意见:</div></td>
    <td colspan="3" rowspan="3">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="right">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="right">&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td colspan="2" align="right">&nbsp;</td>
    <td>&nbsp;</td>
    <td colspan="2"><div align="center">回访客服专员签名:</div></td>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td height="18" colspan="6" align="right"> <div align="right"> 
        <hr size="1">
        <div align="left"></div>
      </div>
      <div align="right"></div></td>
  </tr>
  <tr valign="top" bgcolor="#FFFFFF"> 
    <td height="34" colspan="6" align="right"> <div align="left"><font size="2"><strong><br>
        注:12小时内总部必须收到分公司客服部回复解决方案,如未收到解决方案,将给予相关处罚.</strong></font></div></td>
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
