<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sfzf=null;
String hymm=null;
String hyxm=null;
String xb=null;
String yzbm=null;
String hydz=null;
String sfzhm=null;
String dh=null;
String sj=null;
String dzxx=null;
String csrq=null;
String zydm=null;
String ysrdm=null;
String hyzk=null;
String jhjnr=null;
String arxm=null;
String arsr=null;
String jgyxbm=null;
String fwyxbm=null;
String fgyxbm=null;
String gyyxbm=null;
String zdfgbm=null;
String psahbm=null;
String bzzz=null;
String sztlpp=null;
String shop=null;
String hzppp=null;
String fzpp=null;
String dwbh=null;
String rhrq=null;
String yxrq=null;
String hykh=null;
String hyjb=null;
String fwlx=null;
String gmcs=null;
String xfzje=null;
String jf=null;
String wdhjf=null;
String xxlrr=null;
String bz=null;
String wherehybh=cf.GB2Uni(request.getParameter("hybh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select sfzf,hymm,hyxm,xb,yzbm,hydz,sfzhm,dh,sj,dzxx,csrq,zydm,ysrdm,hyzk,jhjnr,arxm,arsr,jgyxbm,fwyxbm,fgyxbm,gyyxbm,zdfgbm,psahbm,bzzz,sztlpp,shop,hzppp,fzpp,dwbh,rhrq,yxrq,hykh,hyjb,fwlx,gmcs,xfzje,jf,wdhjf,xxlrr,bz ";
	ls_sql+=" from  hy_hyxxb";
	ls_sql+=" where  (hybh='"+wherehybh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		sfzf=cf.fillNull(rs.getString("sfzf"));
		hymm=cf.fillNull(rs.getString("hymm"));
		hyxm=cf.fillNull(rs.getString("hyxm"));
		xb=cf.fillNull(rs.getString("xb"));
		yzbm=cf.fillNull(rs.getString("yzbm"));
		hydz=cf.fillNull(rs.getString("hydz"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));
		dh=cf.fillNull(rs.getString("dh"));
		sj=cf.fillNull(rs.getString("sj"));
		dzxx=cf.fillNull(rs.getString("dzxx"));
		csrq=cf.fillNull(rs.getDate("csrq"));
		zydm=cf.fillNull(rs.getString("zydm"));
		ysrdm=cf.fillNull(rs.getString("ysrdm"));
		hyzk=cf.fillNull(rs.getString("hyzk"));
		jhjnr=cf.fillNull(rs.getDate("jhjnr"));
		arxm=cf.fillNull(rs.getString("arxm"));
		arsr=cf.fillNull(rs.getDate("arsr"));
		jgyxbm=cf.fillNull(rs.getString("jgyxbm"));
		fwyxbm=cf.fillNull(rs.getString("fwyxbm"));
		fgyxbm=cf.fillNull(rs.getString("fgyxbm"));
		gyyxbm=cf.fillNull(rs.getString("gyyxbm"));
		zdfgbm=cf.fillNull(rs.getString("zdfgbm"));
		psahbm=cf.fillNull(rs.getString("psahbm"));
		bzzz=cf.fillNull(rs.getString("bzzz"));
		sztlpp=cf.fillNull(rs.getString("sztlpp"));
		shop=cf.fillNull(rs.getString("shop"));
		hzppp=cf.fillNull(rs.getString("hzppp"));
		fzpp=cf.fillNull(rs.getString("fzpp"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		rhrq=cf.fillNull(rs.getDate("rhrq"));
		yxrq=cf.fillNull(rs.getDate("yxrq"));
		hykh=cf.fillNull(rs.getString("hykh"));
		hyjb=cf.fillNull(rs.getString("hyjb"));
		fwlx=cf.fillNull(rs.getString("fwlx"));
		gmcs=cf.fillNull(rs.getString("gmcs"));
		xfzje=cf.fillNull(rs.getString("xfzje"));
		jf=cf.fillNull(rs.getString("jf"));
		wdhjf=cf.fillNull(rs.getString("wdhjf"));
		xxlrr=cf.fillNull(rs.getString("xxlrr"));
		bz=cf.fillNull(rs.getString("bz"));
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸Ļ�Ա��<%=wherehybh%>����Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditHy_hyxxb.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">ˮ�ʷ�������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="hykh" size="20" maxlength="10"  value="<%=hykh%>" >
              </td>
              <td width="15%"> 
                <div align="right">����ר����</div>
              </td>
              <td width="35%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('0','2','3') order by dwbh",dwbh);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��Ա����</div>
              </td>
              <td width="35%"> 
                <select name="hyjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hyjbbh,hyjb from hy_hyjbb order by hyjbbh",hyjb);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <select name="fwlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+��������&2+��ֵ����",fwlx);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">�������</td>
              <td width="35%"> 
                <input type="text" name="rhrq" size="20" maxlength="10"  value="<%=rhrq%>" >
              </td>
              <td width="15%" align="right">��Ч����</td>
              <td width="35%"> 
                <input type="text" name="yxrq" size="20" maxlength="10"  value="<%=yxrq%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��Ա����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="hyxm" size="20" maxlength="50"  value="<%=hyxm%>" >
              </td>
              <td width="15%"> 
                <div align="right">�Ա�</div>
              </td>
              <td width="35%"> <%
	cf.radioToken(out, "xb","M+��&W+Ů",xb);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="yzbm" size="20" maxlength="12"  value="<%=yzbm%>" >
              </td>
              <td width="15%"> 
                <div align="right">��Ա��ַ</div>
              </td>
              <td width="35%"> 
                <input type="text" name="hydz" size="20" maxlength="200"  value="<%=hydz%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">���֤����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sfzhm" size="20" maxlength="20"  value="<%=sfzhm%>" >
              </td>
              <td width="15%"> 
                <div align="right">�绰</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dh" size="20" maxlength="50"  value="<%=dh%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�ֻ�</div>
              </td>
              <td width="35%"> 
                <input type="text" name="sj" size="20" maxlength="20"  value="<%=sj%>" >
              </td>
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="dzxx" size="20" maxlength="40"  value="<%=dzxx%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="csrq" size="20" maxlength="10"  value="<%=csrq%>" >
              </td>
              <td width="15%"> 
                <div align="right">ְҵ</div>
              </td>
              <td width="35%"> 
                <select name="zydm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xh,zymc from hy_zydmb order by xh",zydm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">������</div>
              </td>
              <td width="35%"> 
                <select name="ysrdm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select xh,ysrdm from hy_ysrdmb order by xh",ysrdm);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">����״��</div>
              </td>
              <td width="35%"> 
<%
	cf.radioToken(out, "hyzk","Y+�ѻ�&N+δ��",hyzk);
%> 
				</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jhjnr" size="20" maxlength="10"  value="<%=jhjnr%>" >
              </td>
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="arxm" size="20" maxlength="50"  value="<%=arxm%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="arsr" size="20" maxlength="10"  value="<%=arsr%>" >
              </td>
              <td width="15%"> 
                <div align="right">�۸�ӡ��</div>
              </td>
              <td width="35%"> 
                <select name="jgyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jgyxbm,jgyxmc from hy_jgyxbm order by jgyxbm",jgyxbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����ӡ��</div>
              </td>
              <td width="35%"> 
                <select name="fwyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fwyxbm,fwyxmc from hy_fwyxbm order by fwyxbm",fwyxbm);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">���ӡ��</div>
              </td>
              <td width="35%"> 
                <select name="fgyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgyxbm,fgyxmc from hy_fgyxbm order by fgyxbm",fgyxbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����ӡ��</div>
              </td>
              <td width="35%"> 
                <select name="gyyxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select gyyxbm,gyyxmc from hy_gyyxbm order by gyyxbm",gyyxbm);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">ר����</div>
              </td>
              <td width="35%"> 
                <select name="zdfgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zdfgbm,zdfgmc from hy_zdfgbm order by zdfgbm",zdfgbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">ƽʱ����</div>
              </td>
              <td width="35%"> 
                <select name="psahbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select psahbm,psahmc  from hy_psahbm order by psahbm",psahbm);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">��Ա����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="hymm" size="20" maxlength="12"  value="<%=hymm%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">ϲ����ֽ��־</td>
              <td colspan="3"> 
                <textarea name="bzzz" cols="55" rows="2"><%=bzzz%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��֪ͬ��Ʒ��</div>
              </td>
              <td colspan="3"> 
                <textarea name="sztlpp" cols="55" rows="2"><%=sztlpp%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">ϲ��ȥ���̵�</td>
              <td colspan="3"> 
                <textarea name="shop" cols="55" rows="2"><%=shop%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">ϲ����ױƷƷ��</div>
              </td>
              <td colspan="3"> 
                <textarea name="hzppp" cols="55" rows="2"><%=hzppp%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">ϲ����װƷ��</td>
              <td colspan="3"> 
                <textarea name="fzpp" cols="55" rows="2"><%=fzpp%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">�������</div>
              </td>
              <td width="35%"> 
                <input type="text" name="gmcs" size="20" maxlength="8"  value="<%=gmcs%>" >
              </td>
              <td width="15%"> 
                <div align="right">�����ܽ��</div>
              </td>
              <td width="35%"> 
                <input type="text" name="xfzje" size="20" maxlength="17"  value="<%=xfzje%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="jf" size="20" maxlength="8"  value="<%=jf%>" >
              </td>
              <td width="15%"> 
                <div align="right">δ�һ�����</div>
              </td>
              <td width="35%"> 
                <input type="text" name="wdhjf" size="20" maxlength="8"  value="<%=wdhjf%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">��ע</div>
              </td>
              <td colspan="3"> 
                <textarea name="bz" cols="55" rows="2"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherehybh"  value="<%=wherehybh%>" >
            <tr> 
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>
              </td>
              <td width="15%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="35%" height="2"> 
                <input type="reset"  value="����">
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.hyxm)=="") {
		alert("������[��Ա����]��");
		FormName.hyxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("��ѡ��[�Ա�]��");
		FormName.xb[0].focus();
		return false;
	}
	if(!(isDatetime(FormName.csrq, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.jhjnr, "��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.arsr, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[����ר����]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.rhrq)=="") {
		alert("������[�������]��");
		FormName.rhrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.rhrq, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.yxrq)=="") {
		alert("������[��Ч����]��");
		FormName.yxrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxrq, "��Ч����"))) {
		return false;
	}
	if(	javaTrim(FormName.hykh)=="") {
		alert("������[ˮ�ʷ�������]��");
		FormName.hykh.focus();
		return false;
	}
	if(	javaTrim(FormName.gmcs)=="") {
		alert("������[�������]��");
		FormName.gmcs.focus();
		return false;
	}
	if(!(isNumber(FormName.gmcs, "�������"))) {
		return false;
	}
	if(	javaTrim(FormName.xfzje)=="") {
		alert("������[�����ܽ��]��");
		FormName.xfzje.focus();
		return false;
	}
	if(!(isFloat(FormName.xfzje, "�����ܽ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jf)=="") {
		alert("������[����]��");
		FormName.jf.focus();
		return false;
	}
	if(!(isNumber(FormName.jf, "����"))) {
		return false;
	}
	if(	javaTrim(FormName.wdhjf)=="") {
		alert("������[δ�һ�����]��");
		FormName.wdhjf.focus();
		return false;
	}
	if(!(isNumber(FormName.wdhjf, "δ�һ�����"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
