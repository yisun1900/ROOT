<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String sgd=null;
String sgdmc=null;
String sgdlx=null;
String dz=null;
String dh=null;
String cz=null;
String email=null;
String dqbm=null;
String bz=null;
String cxbz=null;
String ssfgs=null;
String jjlxr=null;
String lxrdh=null;
String sfzhm=null;
String hjszd=null;
String duihao=null;
String sgdjbbm=null;
String kjdsm=null;
String sfqldht=null;
String jjlxrdz=null;
int bzs=0;
int grs=0;
String rzsj=null;
String lzsj=null;
String wheresgd=cf.GB2Uni(request.getParameter("sgd"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select bzs,grs,rzsj,lzsj,kjdsm,duihao,sgdjbbm,hjszd,sgd,sgdmc,sgdlx,dz,dh,cz,email,bz,dqbm,cxbz,ssfgs,jjlxr,lxrdh,sfzhm,sfqldht,jjlxrdz";
	ls_sql+=" from  sq_sgd";
	ls_sql+=" where  (sgd='"+wheresgd+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		bzs=rs.getInt("bzs");
		grs=rs.getInt("grs");
		rzsj=cf.fillNull(rs.getDate("rzsj"));
		lzsj=cf.fillNull(rs.getDate("lzsj"));
		kjdsm=cf.fillNull(rs.getString("kjdsm"));
		duihao=cf.fillNull(rs.getString("duihao"));
		sgdjbbm=cf.fillNull(rs.getString("sgdjbbm"));
		hjszd=cf.fillNull(rs.getString("hjszd"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgdlx=cf.fillNull(rs.getString("sgdlx"));
		dz=cf.fillNull(rs.getString("dz"));
		dh=cf.fillNull(rs.getString("dh"));
		cz=cf.fillNull(rs.getString("cz"));
		email=cf.fillNull(rs.getString("email"));
		bz=cf.fillNull(rs.getString("bz"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		cxbz=cf.fillNull(rs.getString("cxbz"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		jjlxr=cf.fillNull(rs.getString("jjlxr"));
		lxrdh=cf.fillNull(rs.getString("lxrdh"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));
		sfqldht=cf.fillNull(rs.getString("sfqldht"));
		jjlxrdz=cf.fillNull(rs.getString("jjlxrdz"));
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
      <div align="center">���޸Ĺ�����Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="18%" bgcolor="#CCCCFF"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">�������</font></div>              </td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <input type="text" name="sgd" size="20" maxlength="5"  value="<%=sgd%>" readonly>              </td>
              <td width="17%" bgcolor="#CCCCFF"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC">��������</font></div>              </td>
              <td width="33%" bgcolor="#CCCCFF"> 
                <input type="text" name="sgdmc" size="20" maxlength="100"  value="<%=sgdmc%>" readonly>              </td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#CCCCFF">�Ӻ�</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <input type="text" name="duihao" value="<%=duihao%>" size="20" maxlength="20" >              </td>
              <td width="17%" align="right" bgcolor="#CCCCFF">����</td>
              <td width="33%" bgcolor="#CCCCFF"> 
                <select name="sgdjbbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select sgdjbbm,sgdjbmc from sq_sgdjbbm order by sgdjbbm",sgdjbbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>��������</td>
              <td width="32%"> 
                <input type="hidden" name="oldsgdmc" value="<%=sgdmc%>" >
                <select name="sgdlx" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectToken(out,"S0+ʩ����&S1+ֱ��ʩ����",sgdlx);
%> 
                </select>              </td>
              <td width="17%" align="right">������ͥ��ַ</td>
              <td width="33%"> 
                <input type="text" name="dz" size="20" maxlength="100"  value="<%=dz%>" >              </td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>�����ֹ�˾</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc||'('||dwbh||')' from sq_dwxx where dwlx in('F0') and dwbh='"+ssfgs+"'","");
%> 
                </select>              </td>
              <td width="17%" align="right" bgcolor="#CCCCFF">&nbsp;</td>
              <td width="33%" bgcolor="#CCCCFF">&nbsp;</td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>��������</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  where dqbm='"+dqbm+"'",dqbm);
%> 
                </select>              </td>
              <td width="17%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>������־</td>
              <td width="33%" bgcolor="#CCCCFF"> 
                <select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectToken(out,"Y+�ѳ���&N+δ����",cxbz);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>�����绰</td>
              <td colspan="3"> 
                <input type="text" name="dh" size="72" maxlength="100"  value="<%=dh%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�������ڵ�</td>
              <td colspan="3"> 
                <input type="text" name="hjszd" value="<%=hjszd%>" size="72" maxlength="50" >              </td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#FFFFFF">�ɵ�˵��</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="kjdsm" value="<%=kjdsm%>" size="72" maxlength="50" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">������ϵ��</td>
              <td width="32%"> 
                <input type="text" name="jjlxr" value="<%=jjlxr%>" size="20" maxlength="20" >              </td>
              <td width="17%" align="right">��ϵ�˵绰</td>
              <td width="33%"> 
                <input type="text" name="lxrdh" value="<%=lxrdh%>" size="20" maxlength="50" >              </td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">������ϵ�˵�ַ</td>
              <td colspan="3" bgcolor="#FFFFFF"><input name="jjlxrdz" type="text"  value="<%=jjlxrdz%>" size="72" maxlength="50" ></td>
            </tr>
            <tr> 
              <td width="18%" bgcolor="#FFFFFF" align="right">�������֤��</td>
              <td width="32%" bgcolor="#FFFFFF"> 
                <input type="text" name="sfzhm" value="<%=sfzhm%>" size="20" maxlength="18" >              </td>
              <td width="17%" bgcolor="#FFFFFF" align="right">��������</td>
              <td width="33%" bgcolor="#FFFFFF"> 
                <input type="text" name="cz" size="20" maxlength="20"  value="<%=cz%>" >              </td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right">������</td>
              <td><input type="text" name="bzs" size="20" maxlength="10"  value="<%=bzs%>" ></td>
              <td align="right">������</td>
              <td><input type="text" name="grs" size="20" maxlength="10"  value="<%=grs%>" ></td>
            </tr>
            <tr bgcolor="#CCCCFF">
              <td align="right">��ְʱ��</td>
              <td><input type="text" name="rzsj" size="20" maxlength="10"  value="<%=rzsj%>" onDblClick="JSCalendar(this)"></td>
              <td align="right">��ְʱ��</td>
              <td><input type="text" name="lzsj" size="20" maxlength="10"  value="<%=lzsj%>" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#FFFFFF">�Ƿ�ǩ�Ͷ���ͬ</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
					cf.radioToken(out, "sfqldht","Y+��&N+��",sfqldht);
			  %></td>
            </tr>
            <tr> 
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right">��ע</div>              </td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="bz" cols="70" rows="3"><%=bz%></textarea>              </td>
            </tr>
            <input type="hidden" name="wheresgd"  value="<%=wheresgd%>" >
            <tr> 
              <td colspan="4" > 
                <div align="center"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                  <input type="button"  value="�ɽӵ�����" onClick="f_lrcq(editform)" >
                  <input type="button"  value="�ɽӵ�����" onClick="f_lrdm(editform)" >
                  <input type="button" onClick="f_lrqy(editform)"  value="�ɽӵ�����" >
                </div>              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.sgd)=="") {
		alert("������[�������]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.sgdmc)=="") {
		alert("������[��������]��");
		FormName.sgdmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dh)=="") {
		alert("������[�����绰]��");
		FormName.dh.focus();
		return false;
	}
	if(	javaTrim(FormName.sgdlx)=="") {
		alert("��ѡ��[��λ����]��");
		FormName.sgdlx.focus();
		return false;
	}

	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bzs)=="") {
		alert("��ѡ��[������]��");
		FormName.bzs.focus();
		return false;
	}
	if(!(isNumber(FormName.bzs, "������"))) {
		return false;
	}
	if(	javaTrim(FormName.grs)=="") {
		alert("��ѡ��[������]��");
		FormName.grs.focus();
		return false;
	}
	if(!(isNumber(FormName.grs, "������"))) {
		return false;
	}
	if(!(isDatetime(FormName.rzsj, "��ְʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.lzsj, "��ְʱ��"))) {
		return false;
	}

	FormName.action="SaveEditSq_sgd.jsp";
	FormName.submit();
	return true;
}

function f_lrcq(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.wheresgd)=="") {
		alert("������[�������]��");
		FormName.wheresgd.focus();
		return false;
	}
	FormName.action="EditSq_kjdcq.jsp";
	FormName.submit();
	return true;
}

function f_lrqy(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.wheresgd)=="") {
		alert("������[�������]��");
		FormName.wheresgd.focus();
		return false;
	}
	FormName.action="EditSq_kjdqy.jsp";
	FormName.submit();
	return true;
}


function f_lrdm(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.wheresgd)=="") {
		alert("������[�������]��");
		FormName.wheresgd.focus();
		return false;
	}
	FormName.action="EditSq_kjddm.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
