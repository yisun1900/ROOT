<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010122")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
String dwmc=null;
String dwdh=null;
String dwcz=null;
String bianma=null;
String cwdm=null;
String dhqh=null;
String bz=null;

String jcppbz=null;
String zxkhlrjc=null;
String zxkhlrts=null;
String qdkhbljc=null;
String qdkhblts=null;
String dzbjjc=null;
String hfsjzdsz=null;
String xmzyglbz=null;
String jjgwglbz=null;
String jjsjsglbz=null;

String jcddblxs=null;
String jcddmxblxs=null;
String djlrfs=null;
String kgcxhdbl=null;
String zcmmbz=null;
String mmbz=null;
String cgjjbz=null;
String jjbz=null;
String gcjcbjxs=null;
String sgcbbjxs=null;

String zdyxmshbz=null;
String zdyxmyxq=null;
String clfbfb=null;

String dwbh=cf.GB2Uni(request.getParameter("dwbh"));

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select dwmc,dwdh,dwcz,bianma,cwdm,dhqh,bz";
	ls_sql+=" ,jcppbz,zxkhlrjc,zxkhlrts,qdkhbljc,qdkhblts,dzbjjc,hfsjzdsz,xmzyglbz,jjgwglbz,jjsjsglbz";
	ls_sql+=" ,jcddblxs,jcddmxblxs,djlrfs,kgcxhdbl,zcmmbz,mmbz,cgjjbz,jjbz,gcjcbjxs,sgcbbjxs  ";
	ls_sql+=" ,zdyxmshbz,zdyxmyxq,clfbfb  ";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
		dwdh=cf.fillNull(rs.getString("dwdh"));
		dwcz=cf.fillNull(rs.getString("dwcz"));
		bianma=cf.fillNull(rs.getString("bianma"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
		dhqh=cf.fillNull(rs.getString("dhqh"));
		bz=cf.fillNull(rs.getString("bz"));

		jcppbz=cf.fillNull(rs.getString("jcppbz"));
		zxkhlrjc=cf.fillNull(rs.getString("zxkhlrjc"));
		zxkhlrts=cf.fillNull(rs.getString("zxkhlrts"));
		qdkhbljc=cf.fillNull(rs.getString("qdkhbljc"));
		qdkhblts=cf.fillNull(rs.getString("qdkhblts"));
		dzbjjc=cf.fillNull(rs.getString("dzbjjc"));
		hfsjzdsz=cf.fillNull(rs.getString("hfsjzdsz"));
		xmzyglbz=cf.fillNull(rs.getString("xmzyglbz"));
		jjgwglbz=cf.fillNull(rs.getString("jjgwglbz"));
		jjsjsglbz=cf.fillNull(rs.getString("jjsjsglbz"));

		jcddblxs=cf.fillNull(rs.getString("jcddblxs"));
		jcddmxblxs=cf.fillNull(rs.getString("jcddmxblxs"));
		djlrfs=cf.fillNull(rs.getString("djlrfs"));
		kgcxhdbl=cf.fillNull(rs.getString("kgcxhdbl"));
		zcmmbz=cf.fillNull(rs.getString("zcmmbz"));
		mmbz=cf.fillNull(rs.getString("mmbz"));
		cgjjbz=cf.fillNull(rs.getString("cgjjbz"));
		jjbz=cf.fillNull(rs.getString("jjbz"));
		gcjcbjxs=cf.fillNull(rs.getString("gcjcbjxs"));
		sgcbbjxs=cf.fillNull(rs.getString("sgcbbjxs"));

		zdyxmshbz=cf.fillNull(rs.getString("zdyxmshbz"));
		zdyxmyxq=cf.fillNull(rs.getString("zdyxmyxq"));
		clfbfb=cf.fillNull(rs.getString("clfbfb"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" +ls_sql);
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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">


<form method="post" action="" name="editform">
      <div align="center">�ֹ�˾������ά��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr>
	  <td bgcolor="#CCCCFF" align="right"><font color="#0000FF">��λ���</font> </td>
	  <td bgcolor="#CCCCFF"><%=dwbh%></td><td bgcolor="#CCCCFF" align="right"><font color="#0000FF">��λ����</font></td>
		<td bgcolor="#CCCCFF"><%=dwmc%></td></tr>
	
	<tr bgcolor="#CCCCFF"> 
	  <td width="20%" align="right"><font color="#0000FF">����</font></td>
	  <td width="30%"><%=bianma%></td>
	  <td width="20%" align="right"><font color="#0000FF">�绰����</font></td>
	  <td width="30%"><%=dhqh%></td>
	</tr>
	<tr>
	  <td align="right" bgcolor="#CCCCFF"><font color="#0000FF">��λ�绰</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=dwdh%></td>
	</tr>
	<tr>
	  <td align="right" bgcolor="#CCCCFF"><font color="#0000FF">��λ����</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=dwcz%></td></tr>
	<tr> 
	  <td width="20%" align="right" bgcolor="#CCCCFF"><font color="#0000FF">��ע</font></td>
	  <td colspan="3" bgcolor="#CCCCFF"><%=bz%></td>
	</tr>
	
	<tr>
      <td bgcolor="#FFFFFF" align="right">Ͷ�߱��޹�Ӧ�̼��</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jcppbz","Y+�޶����޷�¼��&N+�޶�����¼��",jcppbz);
%>
          <BR>
          <b><font color="#000099">Ͷ�߱���ʱ��[��Ӧ��]���������ȡ����</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">�����տ���</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "zcmmbz","Y+�޶��������տ�&N+�޶������տ�&M+�ɿ�",zcmmbz);
%>
          <BR>
          <b><font color="#000099">���������Ŀ�ʱ��[�տ�Ʒ��]���������ȡ����</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">ľ���տ���</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "mmbz","Y+�޶��������տ�&N+�޶������տ�&M+�ɿ�",mmbz);
%>
          <BR>
          <b><font color="#000099">������ľ�ſ�ʱ��[�տ�Ʒ��]���������ȡ����</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">�����տ���</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "cgjjbz","Y+�޶��������տ�&N+�޶������տ�&M+�ɿ�",cgjjbz);
%>
          <BR>
          <b><font color="#000099">�����ճ����ʱ��[�տ�Ʒ��]���������ȡ����</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">�Ҿ��տ���</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jjbz","Y+�޶��������տ�&N+�޶������տ�&M+�ɿ�",jjbz);
%>
          <BR>
          <b><font color="#000099">�����ռҾ߿�ʱ��[�տ�Ʒ��]���������ȡ����</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">�����Զ��ط����ã�4λ��</td>
	  <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="hfsjzdsz" value="<%=hfsjzdsz%>" size="10" maxlength="4" >
          <BR>
          <b><font color="#000099">���ݹ��̲����õĹ��̽��ȣ��Զ�������Ӧ�Ŀͷ��ط�ʱ�䣬��1λ�������طã���2λ�����ι��̻طã���3λ�����ڻطã���4λ���깤�ط� 
            ��1�����ã�0��������</font> </b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">������ѯ�ͻ�¼����</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "zxkhlrjc","N+������&Y+����",zxkhlrjc);
%>
	      <b><BR>
          <font color="#000099">��ѯ�ͻ����ϱ�����ǰ������¼�룬����������ǩ���Ǽ�</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">��ѯ�ͻ���ǰ¼������</td>
	  <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="zxkhlrts" value="<%=zxkhlrts%>" size="10" maxlength="8" >
          <BR>
          <b><font color="#000099">ǩ���Ǽ��У�[��ѯ¼��ʱ��]��[ǩ��¼��ʱ��]���������С����</font> </b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">����ǩ���ͻ���¼���</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "qdkhbljc","N+������&Y+����",qdkhbljc);
%>
	      <BR>
          <b><font color="#000099">�Բ�¼ǩ���ͻ��������ƣ�����ĳ����󣬲�����¼</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">ǩ���ͻ���¼��������</td>
	  <td colspan="3" bgcolor="#FFFFFF"><input type="text" name="qdkhblts" value="<%=qdkhblts%>" size="10" maxlength="8" >
          <BR>
          <b><font color="#000099">ǩ���Ǽ��У�[ǩ��¼��ʱ��]��[ǩԼʱ��]��������������</font></b> </td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">���ɶ�����[<b>��ĿרԱ</b>]����</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "xmzyglbz","N+������&Y+����",xmzyglbz);
%>
          <BR>
          <b><font color="#000099">���ɼҾӶ�������ĿרԱ���й��ˣ��������Լ��ĵ����ܿ�</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">���ɶ�����[<b>�Ҿӹ���</b>]����</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jjgwglbz","N+������&Y+����",jjgwglbz);
%>
          <br>
          <b><font color="#000099">���ɼҾӶ����ԼҾӹ��ʽ��й��ˣ��������Լ��ĵ����ܿ�</font></b></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">���ɶ�����[<b>�Ҿ����ʦ</b>]����</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jjsjsglbz","N+������&Y+����",jjsjsglbz);
%>
          <br>
          <b><font color="#000099">���ɼҾӶ����ԼҾ����ʦ���й��ˣ��������Լ��ĵ����ܿ�</font></b></td>
    </tr>
	
	<tr>
      <td bgcolor="#FFFFFF" align="right">���õ��ӱ��ۼ��</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "dzbjjc","1+1���˹�¼��[�ۿ��ʡ�����ԭ����]������[�ۿ��ʡ�����ԭ����]�Զ�����[ǩԼ��]<BR>&2+2���˹�¼��[ǩԼ�����ԭ����]������[ǩԼ�����ԭ����]�Զ�����[�ۿ���]<BR>&3+3��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ���ͬԭ����]�����Զ����㣬����¼����<BR>&6+6��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ���ͬԭ����]�����Զ����㣬��¼����<BR>&4+4�����������ӱ��ۣ�[��ͬԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]���ɸ�<BR>&7+7��[��ͬԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]���ɸģ��ɸ������Ż�<BR>&5+5�����������ӱ��ۣ�[����ԭ����]ȡ�Ե��ӱ��۲��ɸģ��˹�¼��[�ۿ���]���Զ�����[ǩԼ��]",dzbjjc);
%></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">���ɶ�������С��</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jcddblxs","2+2λС��&1+1λС��&0+������λ&-1+����ʮλ&-2+������λ&-3+����ǧλ",jcddblxs);
%></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">���ɶ�����ϸ����С��</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jcddmxblxs","2+2λС��&1+1λС��&0+������λ&-1+����ʮλ&-2+������λ&-3+����ǧλ",jcddmxblxs);
%></td>
    </tr>
	<tr>
      <td bgcolor="#FFFFFF" align="right">���Ķ�������¼�뷽ʽ</td>
	  <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "djlrfs","1+¼�뵥�����ۿ�&2+¼���ۿ��㵥��&3+���ɴ���",djlrfs);
%></td>
    </tr>
	<tr bgcolor="#FFFFFF">
      <td align="right">���Ķ����ɸĴ��������</td>
	  <td><%
	cf.radioToken(out, "kgcxhdbl","Y+�ɸ�&N+���ɸ�",kgcxhdbl);
%></td>
	  <td align="right">&nbsp;</td>
	  <td>&nbsp;</td>
    </tr>
	
	<tr> 
	  <td colspan="4" align="center" > 
		  <input type="hidden" name="dwbh"  value="<%=dwbh%>" >
		  <input type="button"  value="����" onClick="f_do(editform)">
		  <input type="reset"  value="����"></td>
	</tr>
</table>
</form>


</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--



function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��λ���]��");
		FormName.dwbh.focus();
		return false;
	}


	if(	!radioChecked(FormName.jcppbz)) {
		alert("��ѡ��[Ͷ�߱��޹�Ӧ�̼��]��");
		FormName.jcppbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zcmmbz)) {
		alert("��ѡ��[�����տ���]��");
		FormName.zcmmbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.mmbz)) {
		alert("��ѡ��[ľ���տ���]��");
		FormName.mmbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.cgjjbz)) {
		alert("��ѡ��[�����տ���]��");
		FormName.cgjjbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jjbz)) {
		alert("��ѡ��[�Ҿ��տ���]��");
		FormName.jjbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zxkhlrjc)) {
		alert("��ѡ��[������ѯ�ͻ�¼����]��");
		FormName.zxkhlrjc[0].focus();
		return false;
	}
	if (FormName.zxkhlrjc[1].checked)
	{
		if(	javaTrim(FormName.zxkhlrts)=="") {
			alert("��ѡ��[��ѯ�ͻ���ǰ¼������]��");
			FormName.zxkhlrts.focus();
			return false;
		}
		if(!(isNumber(FormName.zxkhlrts, "��ѯ�ͻ���ǰ¼������"))) {
			return false;
		}
	}
	else{
		FormName.zxkhlrts.value="";
	}


	if(	!radioChecked(FormName.qdkhbljc)) {
		alert("��ѡ��[����ǩ���ͻ���¼���]��");
		FormName.qdkhbljc[0].focus();
		return false;
	}
	if (FormName.qdkhbljc[1].checked)
	{
		if(	javaTrim(FormName.qdkhblts)=="") {
			alert("��ѡ��[ǩ���ͻ���¼��������]��");
			FormName.qdkhblts.focus();
			return false;
		}
		if(!(isNumber(FormName.qdkhblts, "ǩ���ͻ���¼��������"))) {
			return false;
		}
	}
	else{
		FormName.qdkhblts.value="";
	}

	if(	!radioChecked(FormName.dzbjjc)) {
		alert("��ѡ��[���õ��ӱ��ۼ��]��");
		FormName.dzbjjc[0].focus();
		return false;
	}

	if(	javaTrim(FormName.hfsjzdsz)=="") {
		alert("��ѡ��[�����Զ��ط�����]��");
		FormName.hfsjzdsz.focus();
		return false;
	}
	if (FormName.hfsjzdsz.value.length!=4)
	{
		alert("[�����Զ��ط�����]����4λ��");
		FormName.hfsjzdsz.focus();
		return false;
	}


	if(	!radioChecked(FormName.xmzyglbz)) {
		alert("��ѡ��[���ɶ�������ĿרԱ����]��");
		FormName.xmzyglbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jjgwglbz)) {
		alert("��ѡ��[���ɶ����ԼҾӹ��ʹ���]��");
		FormName.jjgwglbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.jjsjsglbz)) {
		alert("��ѡ��[���ɶ����ԼҾ����ʦ���˱�־]��");
		FormName.jjsjsglbz[0].focus();
		return false;
	}


	if(	!radioChecked(FormName.jcddblxs)) {
		alert("��ѡ��[���ɶ�������С��]��");
		FormName.jcddblxs[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.jcddmxblxs)) {
		alert("��ѡ��[���ɶ�����ϸ����С��]��");
		FormName.jcddmxblxs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.djlrfs)) {
		alert("��ѡ��[���Ķ�������¼�뷽ʽ]��");
		FormName.djlrfs[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.kgcxhdbl)) {
		alert("��ѡ��[���Ķ����ɸĴ��������]��");
		FormName.kgcxhdbl[0].focus();
		return false;
	}
	if (FormName.djlrfs[2].checked)
	{
		if (FormName.kgcxhdbl[0].checked)
		{
			alert("���󣡵��۲��ɴ��ۣ�����ѡ�񡾲��ɸġ�");
			FormName.kgcxhdbl[1].focus();
			return false;
		}
	}



	FormName.action="SaveEditCsSq_dwxx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>











