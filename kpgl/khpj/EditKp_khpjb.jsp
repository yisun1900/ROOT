<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sgzl=null;
String gcjd=null;
String wmsgcd=null;
String ctfw=null;
String pscl=null;
String dmcl=null;
String sjxg=null;
String sjfw=null;
String jlfw=null;
String lrr=null;
String lrsj=null;
String bz=null;

String khxm=null;
String fwdz=null;
String lxfs=null;

String dwbh=null;
String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String sjkgrq=null;
String sjjgrq=null;

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,sgzl,gcjd,wmsgcd,ctfw,pscl,dmcl,sjxg,sjfw,jlfw,lrr,lrsj,bz ";
	ls_sql+=" from  kp_khpjb";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sgzl=cf.fillNull(rs.getString("sgzl"));
		gcjd=cf.fillNull(rs.getString("gcjd"));
		wmsgcd=cf.fillNull(rs.getString("wmsgcd"));
		ctfw=cf.fillNull(rs.getString("ctfw"));
		pscl=cf.fillNull(rs.getString("pscl"));
		dmcl=cf.fillNull(rs.getString("dmcl"));
		sjxg=cf.fillNull(rs.getString("sjxg"));
		sjfw=cf.fillNull(rs.getString("sjfw"));
		jlfw=cf.fillNull(rs.getString("jlfw"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,dwbh,sjs,sgd,sgbz,zjxm,hth,sjkgrq,sjjgrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));

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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 客户评价表</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditKp_khpjb.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">客户编号</font></div>
              </td>
              <td width="32%"> <%=khbh%> 
                <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">合同号</font></div>
              </td>
              <td width="32%"> <%=hth%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">客户姓名</font></div>
              </td>
              <td width="32%"> <%=khxm%>（<%=lxfs%>） </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">签约店面</font></div>
              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">房屋地址</font></td>
              <td colspan="3"> <%=fwdz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">设计师</font></div>
              </td>
              <td width="32%"> <%=sjs%> </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">质检员</font></div>
              </td>
              <td width="32%"> <%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">施工队</font></div>
              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sgd+"'",sgd,true);
%> </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">施工班组</font></div>
              </td>
              <td width="32%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">实开工日期</font></td>
              <td width="32%"> <%=sjkgrq%> </td>
              <td width="18%" align="right"><font color="#0000CC">实交工日期</font></td>
              <td width="32%"> <%=sjjgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">施工质量</div>
              </td>
              <td width="32%"><%
	cf.radioToken(out, "sgzl","1+满意&2+基本满意&3+不满意",sgzl);
%> </td>
              <td width="18%"> 
                <div align="right"></div>
              </td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">工程进度</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "gcjd","1+满意&2+基本满意&3+不满意",gcjd);
%> </td>
              <td width="18%"> 
                <div align="right">工人文明施工程度</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "wmsgcd","1+满意&2+基本满意&3+不满意",wmsgcd);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">施工队整体服务</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "ctfw","1+满意&2+基本满意&3+不满意",ctfw);
%> </td>
              <td width="18%"> 
                <div align="right">公司配送材料</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "pscl","1+满意&2+基本满意&3+不满意",pscl);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">施工队代买材料</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "dmcl","1+满意&2+基本满意&3+不满意",dmcl);
%> </td>
              <td width="18%"> 
                <div align="right">设计效果</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "sjxg","1+满意&2+基本满意&3+不满意",sjxg);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">设计服务</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "sjfw","1+满意&2+基本满意&3+不满意",sjfw);
%> </td>
              <td width="18%"> 
                <div align="right">监理服务</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "jlfw","1+满意&2+基本满意&3+不满意",jlfw);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">录入人</div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrr" size="20" maxlength="20"  value="<%=lrr%>" readonly>
              </td>
              <td width="18%"> 
                <div align="right">录入时间</div>
              </td>
              <td width="32%"> 
                <input type="text" name="lrsj" size="20" maxlength="10"  value="<%=lrsj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
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
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.sgzl)) {
		alert("请选择[施工质量]！");
		FormName.sgzl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.gcjd)) {
		alert("请选择[工程进度]！");
		FormName.gcjd[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.wmsgcd)) {
		alert("请选择[工人文明施工程度]！");
		FormName.wmsgcd[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.ctfw)) {
		alert("请选择[施工队整体服务]！");
		FormName.ctfw[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.pscl)) {
		alert("请选择[公司配送材料]！");
		FormName.pscl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.dmcl)) {
		alert("请选择[施工队代买材料]！");
		FormName.dmcl[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sjxg)) {
		alert("请选择[设计效果]！");
		FormName.sjxg[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sjfw)) {
		alert("请选择[设计服务]！");
		FormName.sjfw[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jlfw)) {
		alert("请选择[监理服务]！");
		FormName.jlfw[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
