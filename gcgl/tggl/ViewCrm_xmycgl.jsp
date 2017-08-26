<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String crm_xmycgl_djbh=null;
String crm_xmycgl_khbh=null;
String crm_khxx_khxm=null;
String crm_khxx_fwdz=null;
String crm_khxx_hth=null;
String crm_khxx_sjs=null;
String crm_xmycgl_cxwtsj=null;
String crm_xmycgl_dsr=null;
String crm_xmycgl_cxwt=null;
String crm_xmycgl_jjfazdr=null;
String crm_xmycgl_jjfazdsj=null;
String crm_xmycgl_jjfa=null;
String crm_xmycgl_jjfashr=null;
String crm_xmycgl_jjfashsj=null;
String crm_xmycgl_clqklrr=null;
String crm_xmycgl_clqklrsj=null;
String crm_xmycgl_sjcljg=null;
String crm_xmycgl_sjclqk=null;
String crm_xmycgl_tgsqr=null;
String crm_xmycgl_tgsqsj=null;
String crm_xmycgl_tgsqyy=null;
String crm_xmycgl_tgshr=null;
String crm_xmycgl_tgshsj=null;
String crm_xmycgl_tgshjg=null;
String crm_xmycgl_tgshsm=null;
String crm_xmycgl_tgyybm=null;
String crm_xmycgl_tgkssj=null;
String crm_xmycgl_gjfgsj=null;
String crm_xmycgl_tglrr=null;
String crm_xmycgl_tglrsj=null;
String crm_xmycgl_sjfgsj=null;
String crm_xmycgl_fglrr=null;
String crm_xmycgl_fglrsj=null;
String crm_xmycgl_fgsm=null;
String crm_xmycgl_zt=null;
String crm_xmycgl_lrr=null;
String crm_xmycgl_lrsj=null;
String crm_xmycgl_lrbm=null;
String crm_xmycgl_bz=null;
String wherecrm_xmycgl_djbh=null;
wherecrm_xmycgl_djbh=cf.GB2Uni(request.getParameter("djbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	ls_sql="select crm_xmycgl.djbh as crm_xmycgl_djbh,crm_xmycgl.khbh as crm_xmycgl_khbh,crm_khxx.khxm as crm_khxx_khxm,crm_khxx.fwdz as crm_khxx_fwdz,crm_khxx.hth as crm_khxx_hth,crm_khxx.sjs as crm_khxx_sjs,crm_xmycgl.cxwtsj as crm_xmycgl_cxwtsj,crm_xmycgl.dsr as crm_xmycgl_dsr,crm_xmycgl.cxwt as crm_xmycgl_cxwt,crm_xmycgl.jjfazdr as crm_xmycgl_jjfazdr,crm_xmycgl.jjfazdsj as crm_xmycgl_jjfazdsj,crm_xmycgl.jjfa as crm_xmycgl_jjfa,crm_xmycgl.jjfashr as crm_xmycgl_jjfashr,crm_xmycgl.jjfashsj as crm_xmycgl_jjfashsj,crm_xmycgl.clqklrr as crm_xmycgl_clqklrr,crm_xmycgl.clqklrsj as crm_xmycgl_clqklrsj,crm_xmycgl.sjcljg as crm_xmycgl_sjcljg,crm_xmycgl.sjclqk as crm_xmycgl_sjclqk,crm_xmycgl.tgsqr as crm_xmycgl_tgsqr,crm_xmycgl.tgsqsj as crm_xmycgl_tgsqsj,crm_xmycgl.tgsqyy as crm_xmycgl_tgsqyy,crm_xmycgl.tgshr as crm_xmycgl_tgshr,crm_xmycgl.tgshsj as crm_xmycgl_tgshsj,crm_xmycgl.tgshjg as crm_xmycgl_tgshjg,crm_xmycgl.tgshsm as crm_xmycgl_tgshsm,crm_xmycgl.tgyybm as crm_xmycgl_tgyybm,crm_xmycgl.tgkssj as crm_xmycgl_tgkssj,crm_xmycgl.gjfgsj as crm_xmycgl_gjfgsj,crm_xmycgl.tglrr as crm_xmycgl_tglrr,crm_xmycgl.tglrsj as crm_xmycgl_tglrsj,crm_xmycgl.sjfgsj as crm_xmycgl_sjfgsj,crm_xmycgl.fglrr as crm_xmycgl_fglrr,crm_xmycgl.fglrsj as crm_xmycgl_fglrsj,crm_xmycgl.fgsm as crm_xmycgl_fgsm,crm_xmycgl.zt as crm_xmycgl_zt,crm_xmycgl.lrr as crm_xmycgl_lrr,crm_xmycgl.lrsj as crm_xmycgl_lrsj,dwmc as crm_xmycgl_lrbm,crm_xmycgl.bz as crm_xmycgl_bz ";
	ls_sql+=" from  crm_khxx,crm_xmycgl,sq_dwxx";
	ls_sql+=" where crm_xmycgl.khbh=crm_khxx.khbh(+) and  (crm_xmycgl.djbh='"+wherecrm_xmycgl_djbh+"')  ";
	ls_sql+=" and crm_xmycgl.lrbm=sq_dwxx.dwbh(+) ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		crm_xmycgl_djbh=cf.fillNull(rs.getString("crm_xmycgl_djbh"));
		crm_xmycgl_khbh=cf.fillNull(rs.getString("crm_xmycgl_khbh"));
		crm_khxx_khxm=cf.fillNull(rs.getString("crm_khxx_khxm"));
		crm_khxx_fwdz=cf.fillNull(rs.getString("crm_khxx_fwdz"));
		crm_khxx_hth=cf.fillNull(rs.getString("crm_khxx_hth"));
		crm_khxx_sjs=cf.fillNull(rs.getString("crm_khxx_sjs"));
		crm_xmycgl_cxwtsj=cf.fillNull(rs.getDate("crm_xmycgl_cxwtsj"));
		crm_xmycgl_dsr=cf.fillNull(rs.getString("crm_xmycgl_dsr"));
		crm_xmycgl_cxwt=cf.fillNull(rs.getString("crm_xmycgl_cxwt"));
		crm_xmycgl_jjfazdr=cf.fillNull(rs.getString("crm_xmycgl_jjfazdr"));
		crm_xmycgl_jjfazdsj=cf.fillNull(rs.getDate("crm_xmycgl_jjfazdsj"));
		crm_xmycgl_jjfa=cf.fillNull(rs.getString("crm_xmycgl_jjfa"));
		crm_xmycgl_jjfashr=cf.fillNull(rs.getString("crm_xmycgl_jjfashr"));
		crm_xmycgl_jjfashsj=cf.fillNull(rs.getDate("crm_xmycgl_jjfashsj"));
		crm_xmycgl_clqklrr=cf.fillNull(rs.getString("crm_xmycgl_clqklrr"));
		crm_xmycgl_clqklrsj=cf.fillNull(rs.getDate("crm_xmycgl_clqklrsj"));
		crm_xmycgl_sjcljg=cf.fillNull(rs.getString("crm_xmycgl_sjcljg"));
		crm_xmycgl_sjclqk=cf.fillNull(rs.getString("crm_xmycgl_sjclqk"));
		crm_xmycgl_tgsqr=cf.fillNull(rs.getString("crm_xmycgl_tgsqr"));
		crm_xmycgl_tgsqsj=cf.fillNull(rs.getDate("crm_xmycgl_tgsqsj"));
		crm_xmycgl_tgsqyy=cf.fillNull(rs.getString("crm_xmycgl_tgsqyy"));
		crm_xmycgl_tgshr=cf.fillNull(rs.getString("crm_xmycgl_tgshr"));
		crm_xmycgl_tgshsj=cf.fillNull(rs.getDate("crm_xmycgl_tgshsj"));
		crm_xmycgl_tgshjg=cf.fillNull(rs.getString("crm_xmycgl_tgshjg"));
		crm_xmycgl_tgshsm=cf.fillNull(rs.getString("crm_xmycgl_tgshsm"));
		crm_xmycgl_tgyybm=cf.fillNull(rs.getString("crm_xmycgl_tgyybm"));
		crm_xmycgl_tgkssj=cf.fillNull(rs.getDate("crm_xmycgl_tgkssj"));
		crm_xmycgl_gjfgsj=cf.fillNull(rs.getDate("crm_xmycgl_gjfgsj"));
		crm_xmycgl_tglrr=cf.fillNull(rs.getString("crm_xmycgl_tglrr"));
		crm_xmycgl_tglrsj=cf.fillNull(rs.getDate("crm_xmycgl_tglrsj"));
		crm_xmycgl_sjfgsj=cf.fillNull(rs.getDate("crm_xmycgl_sjfgsj"));
		crm_xmycgl_fglrr=cf.fillNull(rs.getString("crm_xmycgl_fglrr"));
		crm_xmycgl_fglrsj=cf.fillNull(rs.getDate("crm_xmycgl_fglrsj"));
		crm_xmycgl_fgsm=cf.fillNull(rs.getString("crm_xmycgl_fgsm"));
		crm_xmycgl_zt=cf.fillNull(rs.getString("crm_xmycgl_zt"));
		crm_xmycgl_lrr=cf.fillNull(rs.getString("crm_xmycgl_lrr"));
		crm_xmycgl_lrsj=cf.fillNull(rs.getDate("crm_xmycgl_lrsj"));
		crm_xmycgl_lrbm=cf.fillNull(rs.getString("crm_xmycgl_lrbm"));
		crm_xmycgl_bz=cf.fillNull(rs.getString("crm_xmycgl_bz"));
	}
	rs.close();
	ps.close();
}
catch (Exception e) {
	out.print("<BR>出错:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
<title>查看信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE3 {color: #FF0000; font-weight: bold; }
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<div align="center">项目异常管理（登记编号：<%=crm_xmycgl_djbh%>）</div>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">客户编号</td>
  <td width="32%"><%=crm_xmycgl_khbh%></td>
  <td align="right" width="18%">合同号 </td>
  <td width="32%"><%=crm_khxx_hth%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    客户姓名  </td>
  <td width="32%"> 
    <%=crm_khxx_khxm%>  </td>
  <td align="right" width="18%">设计师</td>
  <td width="32%"><%=crm_khxx_sjs%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">房屋地址</td>
  <td colspan="3"><%=crm_khxx_fwdz%></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    当事人</td>
  <td width="32%" bgcolor="#FFFFCC"><%=crm_xmycgl_dsr%></td>
  <td width="18%" align="right" bgcolor="#FFFFCC">出现问题时间 </td>
  <td width="32%" bgcolor="#FFFFCC"><%=crm_xmycgl_cxwtsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    出现问题  </td>
  <td colspan="3" bgcolor="#FFFFCC"> 
    <%=crm_xmycgl_cxwt%>  </td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#E8E8FF">解决方案制订人</td>
  <td bgcolor="#E8E8FF"><%=crm_xmycgl_jjfazdr%></td>
  <td align="right" bgcolor="#E8E8FF">解决方案制订时间</td>
  <td bgcolor="#E8E8FF"><%=crm_xmycgl_jjfazdsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#E8E8FF">解决方案</td>
  <td colspan="3" bgcolor="#E8E8FF"><%=crm_xmycgl_jjfa%></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    解决方案审核人  </td>
  <td width="32%" bgcolor="#FFFFCC"> 
    <%=crm_xmycgl_jjfashr%>  </td>
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    解决方案审核时间  </td>
  <td width="32%" bgcolor="#FFFFCC"> 
    <%=crm_xmycgl_jjfashsj%>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#E8E8FF"> 
    处理情况录入人  </td>
  <td width="32%" bgcolor="#E8E8FF"> 
    <%=crm_xmycgl_clqklrr%>  </td>
  <td width="18%" align="right" bgcolor="#E8E8FF"> 
    处理情况录入时间  </td>
  <td width="32%" bgcolor="#E8E8FF"> 
    <%=crm_xmycgl_clqklrsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#E8E8FF"> 
    实际处理结果  </td>
  <td width="32%" bgcolor="#E8E8FF"> 
<%
	cf.radioToken(out, "Y+解决&N+未解决",crm_xmycgl_sjcljg,true);
%>  </td>
  <td width="18%" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  <td width="32%" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#E8E8FF">实际处理情况</td>
  <td colspan="3" bgcolor="#E8E8FF"><%=crm_xmycgl_sjclqk%></td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    停工申请人  </td>
  <td width="32%" bgcolor="#FFFFCC"> 
    <%=crm_xmycgl_tgsqr%>  </td>
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    停工申请时间  </td>
  <td width="32%" bgcolor="#FFFFCC"> 
    <%=crm_xmycgl_tgsqsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    停工申请原因  </td>
  <td colspan="3" bgcolor="#FFFFCC"> 
    <%=crm_xmycgl_tgsqyy%>  </td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#E8E8FF">停工审核人</td>
  <td bgcolor="#E8E8FF"><%=crm_xmycgl_tgshr%></td>
  <td align="right" bgcolor="#E8E8FF">停工审核时间</td>
  <td bgcolor="#E8E8FF"><%=crm_xmycgl_tgshsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#E8E8FF">停工审核结果</td>
  <td width="32%" bgcolor="#E8E8FF"><%
	cf.radioToken(out, "Y+通过&N+未通过",crm_xmycgl_tgshjg,true);
%></td>
  <td width="18%" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  <td width="32%" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#E8E8FF"> 
    停工审核说明  </td>
  <td colspan="3" bgcolor="#E8E8FF"> 
    <%=crm_xmycgl_tgshsm%>  </td>
  </tr>

<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    停工开始时间  </td>
  <td width="32%" bgcolor="#FFFFCC"> 
    <%=crm_xmycgl_tgkssj%>  </td>
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    估计复工日期  </td>
  <td width="32%" bgcolor="#FFFFCC"> 
    <%=crm_xmycgl_gjfgsj%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFCC">停工原因</td>
  <td bgcolor="#FFFFCC"><%
	cf.selectItem(out,"select tgyybm,tgyymc from dm_tgyybm order by tgyybm",crm_xmycgl_tgyybm,true);
%></td>
  <td align="right" bgcolor="#FFFFCC">&nbsp;</td>
  <td bgcolor="#FFFFCC">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    停工录入人  </td>
  <td width="32%" bgcolor="#FFFFCC"> 
    <%=crm_xmycgl_tglrr%>  </td>
  <td width="18%" align="right" bgcolor="#FFFFCC"> 
    停工录入时间  </td>
  <td width="32%" bgcolor="#FFFFCC"> 
    <%=crm_xmycgl_tglrsj%>  </td>
</tr>

<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#E8E8FF"> 
    实际复工日期  </td>
  <td width="32%" bgcolor="#E8E8FF"> 
    <%=crm_xmycgl_sjfgsj%>  </td>
  <td width="18%" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  <td width="32%" bgcolor="#E8E8FF">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#E8E8FF">复工录入人</td>
  <td width="32%" bgcolor="#E8E8FF"><%=crm_xmycgl_fglrr%></td>
  <td width="18%" align="right" bgcolor="#E8E8FF">复工录入时间</td>
  <td width="32%" bgcolor="#E8E8FF"><%=crm_xmycgl_fglrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#E8E8FF">复工说明</td>
  <td colspan="3" bgcolor="#E8E8FF"><%=crm_xmycgl_fgsm%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td width="18%" align="right" bgcolor="#FFFFFF"><span class="STYLE3"> 
    状态  </span></td>
  <td width="32%" bgcolor="#FFFFFF"> 
    <span class="STYLE3">
    <%
	cf.selectToken(out,"1+异常录入&2+制订方案&3+方案审核&4+异常处理&5+停工申请&6+停工审批&7+办理停工&8+办理复工",crm_xmycgl_zt,true);
%>  
    </span></td>
  <td align="right" width="18%"> 
    录入人  </td>
  <td width="32%"> 
    <%=crm_xmycgl_lrr%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    录入时间  </td>
  <td width="32%"> 
    <%=crm_xmycgl_lrsj%>  </td>
  <td align="right" width="18%"> 
    录入部门  </td>
  <td width="32%"> 
<%=crm_xmycgl_lrbm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"> 
    备注  </td>
  <td width="32%"> 
    <%=crm_xmycgl_bz%>  </td>
  <td align="right" width="18%">&nbsp;  </td>
  <td width="32%">&nbsp;  </td>
</tr>
</table>
</body>
</html>
