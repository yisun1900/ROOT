<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String dwstr=cf.getItemData("select dwbh,dwmc||'��'||dwdh||'��',ssdw from sq_dwxx where dwlx='4' order by ssdw,dwbh");

String khxm=null;
String xb=null;
String fwdz=null;
String cqbm=null;
String lxfs=null;
String hxbm=null;
String fgflbm=null;
String zxjwbm=null;
String ysbm=null;
String hxmjbm=null;
String fwmj=null;
String pmjj=null;
String hth=null;
String sjs=null;
String qye=null;
String sfyyh=null;
String yhyy=null;
String fzxm=null;
String qyrq=null;
String kgrq=null;
String zkrq=null;
String jgrq=null;
String skje=null;
String skrq=null;
String zkje=null;
String hdbz=null;
String khlxbm=null;
String ybjbh=null;
String bz=null;

String cgdz=null;
String hdsgd=null;
String hdsgbz=null;
String hdsjs=null;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khxm,xb,fwdz,cqbm,lxfs,hxbm,fgflbm,zxjwbm,ysbm,hxmjbm,fwmj,pmjj,hth,sjs,qye,sfyyh,yhyy,fzxm,qyrq,kgrq,skje,skrq,zkje,hdbz,khlxbm,bz,zkrq,jgrq,ybjbh,cgdz,hdsgd,hdsgbz,hdsjs ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fgflbm=cf.fillNull(rs.getString("fgflbm"));
		zxjwbm=cf.fillNull(rs.getString("zxjwbm"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		hxmjbm=cf.fillNull(rs.getString("hxmjbm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		pmjj=cf.fillNull(rs.getString("pmjj"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhyy=cf.fillNull(rs.getString("yhyy"));
		fzxm=cf.fillNull(rs.getString("fzxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		skje=cf.fillNull(rs.getString("skje"));
		skrq=cf.fillNull(rs.getDate("skrq"));
		zkje=cf.fillNull(rs.getString("zkje"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));
		zkrq=cf.fillNull(rs.getDate("zkrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ybjbh=cf.fillNull(rs.getString("ybjbh"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdsgd=cf.fillNull(rs.getString("hdsgd"));
		hdsgbz=cf.fillNull(rs.getString("hdsgbz"));
		hdsjs=cf.fillNull(rs.getString("hdsjs"));
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
      <div align="center"> ���޸���Ϣ��<font color="#FF0033">*</font>Ϊ�����ֶΣ�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditCrm_khxx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>�ͻ�����</div>
              </td>
              <td width="32%"> 
                <input type="text" name="khxm" size="20" maxlength="50"  value="<%=khxm%>" >
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>�Ա�</div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "xb","M+��&W+Ů",xb);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0033">*</font>���ݵ�ַ</td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="57" maxlength="100"  value="<%=fwdz%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>��������</div>
              </td>
              <td width="32%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>��ϵ��ʽ</div>
              </td>
              <td width="32%"> 
                <input type="text" name="lxfs" size="20" maxlength="50"  value="<%=lxfs%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>����</div>
              </td>
              <td width="32%"> 
                <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>���</div>
              </td>
              <td width="32%"> 
                <select name="fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgflbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>װ�޼�λ</div>
              </td>
              <td width="32%"> 
                <select name="zxjwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",zxjwbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>��ɫ</div>
              </td>
              <td width="32%"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm",ysbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>�������</div>
              </td>
              <td width="32%"> 
                <select name="hxmjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxmjbm,hxmjmc from dm_hxmjbm order by hxmjbm",hxmjbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>�������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="fwmj" size="20" maxlength="8"  value="<%=fwmj%>"  onChange="calValue(editform)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>ǩԼ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="qye" size="20" maxlength="8"  value="<%=qye%>"  onChange="calValue(editform)" >
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font><font color="#0000CC">ÿƽ�׾���</font></div>
              </td>
              <td width="32%"> 
                <input type="text" name="pmjj" size="20" maxlength="8"  value="<%=pmjj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>�Ƿ����Ż�</div>
              </td>
              <td width="32%"><%
	cf.radioToken(out, "sfyyh","Y+��&N+��",sfyyh);
%> </td>
              <td width="18%"> 
                <div align="right">������Ŀ</div>
              </td>
              <td width="32%"> 
                <input type="text" name="fzxm" size="20" maxlength="100"  value="<%=fzxm%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�Ż�ԭ��</td>
              <td colspan="3"> 
                <input type="text" name="yhyy" size="57" value="<%=yhyy%>" maxlength="200">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>ǩԼ����</div>
              </td>
              <td width="32%"> 
                <input type="text" name="qyrq" size="20" maxlength="10"  value="<%=qyrq%>" >
              </td>
              <td width="18%"> 
                <div align="right">Ӧ��������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="kgrq" size="20" maxlength="10"  value="<%=kgrq%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�׿�����</td>
              <td width="32%"> 
                <input type="text" name="skrq" size="20" maxlength="10"  value="<%=skrq%>" >
              </td>
              <td width="18%" align="right">�׿���</td>
              <td width="32%"> 
                <input type="text" name="skje" size="20" maxlength="8"  value="<%=skje%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">���ڿ�����</div>
              </td>
              <td width="32%"> 
                <input type="text" name="zkrq" size="20" maxlength="10"  value="<%=zkrq%>" >
              </td>
              <td width="18%"> 
                <div align="right">�п���</div>
              </td>
              <td width="32%"> 
                <input type="text" name="zkje" size="20" maxlength="8"  value="<%=zkje%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">Ӧ��������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="jgrq" size="20" maxlength="10"  value="<%=jgrq%>" >
              </td>
              <td width="18%"> 
                <div align="right">�ι��������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="ybjbh" value="<%=ybjbh%>" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>���ʦ</div>
              </td>
              <td width="32%"> 
                <input type="text" name="sjs" size="20" maxlength="20"  value="<%=sjs%>" >
              </td>
              <td width="18%"> 
                <div align="right">��ͬ��</div>
              </td>
              <td width="32%"> 
                <input type="text" name="hth" size="20" maxlength="20"  value="<%=hth%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>��ϵ�ͻ�</div>
              </td>
              <td width="32%"> 
                <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0033">*</font>�ص���־</div>
              </td>
              <td width="32%"> 
                <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectToken(out,"1+�ǻص�&2+���ʦ�ص�&3+ʩ���ӻص�&4+�Ͽͻ��ص�&5+Ա���ص�&6+�೤�ص�&7+��¥��&8+������&9+����",hdbz,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">�ι۵�ַ</td>
              <td width="35%"> 
                <input type="text" name="cgdz" value="<%=cgdz%>" size="20" maxlength="100" >
              </td>
              <td width="15%" align="right">�ص����ʦ</td>
              <td width="35%"> 
                <input type="text" name="hdsjs" value="<%=hdsjs%>" size="20" maxlength="20" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#FF0033">*</font>�ص�ʩ����</div>
              </td>
              <td width="35%"> 
                <select name="hdsgd" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(hdsgd,hdsgbz,<%=dwstr%>)">
                  <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('3','8') order by dwbh",hdsgd);
%> 
                </select>
              </td>
              <td width="15%"> 
                <div align="right">�ص�����</div>
              </td>
              <td width="35%"> 
                <select name="hdsgbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssdw='"+hdsgd+"' order by dwbh",hdsgbz);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="55" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <tr> 
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="32%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>
              </td>
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="32%" height="2"> 
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
function calValue(FormName){  
	FormName.pmjj.value=parseInt(FormName.qye.value/FormName.fwmj.value);      
}      

function f_do(FormName)//����FormName:Form������
{
	calValue(FormName);


	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("��ѡ��[�Ա�]��");
		FormName.xb[0].focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("������[���ݵ�ַ]��");
		FormName.fwdz.focus();
		return false;
	}
	if(	javaTrim(FormName.cqbm)=="") {
		alert("������[��������]��");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.lxfs)=="") {
		alert("������[��ϵ��ʽ]��");
		FormName.lxfs.focus();
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("������[����]��");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgflbm)=="") {
		alert("������[������]��");
		FormName.fgflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.zxjwbm)=="") {
		alert("������[װ�޼�λ]��");
		FormName.zxjwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ysbm)=="") {
		alert("������[��ɫ]��");
		FormName.ysbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hxmjbm)=="") {
		alert("������[�������]��");
		FormName.hxmjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwmj)=="") {
		alert("������[���]��");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "���"))) {
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("������[ǩԼ��]��");
		FormName.qye.focus();
		return false;
	}
	if(!(isNumber(FormName.qye, "ǩԼ��"))) {
		return false;
	}
	if(	javaTrim(FormName.pmjj)=="") {
		alert("������[ÿƽ�׾���]��");
		FormName.pmjj.focus();
		return false;
	}
	if(!(isNumber(FormName.pmjj, "ÿƽ�׾���"))) {
		return false;
	}
	if(	!radioChecked(FormName.sfyyh)) {
		alert("��ѡ��[�Ƿ����Ż�]��");
		FormName.sfyyh[0].focus();
		return false;
	}
	if(	javaTrim(FormName.qyrq)=="") {
		alert("������[ǩԼ����]��");
		FormName.qyrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "ǩԼ����"))) {
		return false;
	}
	if(!(isDatetime(FormName.kgrq, "Ӧ��������"))) {
		return false;
	}
	if(!(isDatetime(FormName.skrq, "�׿�����"))) {
		return false;
	}
	if(!(isNumber(FormName.skje, "�׿���"))) {
		return false;
	}
	if(!(isDatetime(FormName.zkrq, "���ڿ�����"))) {
		return false;
	}
	if(!(isNumber(FormName.zkje, "�п���"))) {
		return false;
	}
	if(!(isDatetime(FormName.jgrq, "Ӧ��������"))) {
		return false;
	}

	if(	javaTrim(FormName.sjs)=="") {
		alert("������[���ʦ]��");
		FormName.sjs.focus();
		return false;
	}
	if(	javaTrim(FormName.khlxbm)=="") {
		alert("��ѡ��[��ϵ�ͻ�]��");
		FormName.khlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.hdbz)=="") {
		alert("��ѡ��[�ص���־]��");
		FormName.hdbz.focus();
		return false;
	}

	if(	javaTrim(FormName.hdsgd)=="") {
		alert("������[�ص�ʩ����]��");
		FormName.hdsgd.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
