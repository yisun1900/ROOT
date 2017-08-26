<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;
String qyrq=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String sgd=null;
String sgbz=null;
String zjxm=null;



String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,khxm,fwdz,hth,sjs,qyrq,crm_khxx.dwbh,dwmc   ,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));

		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
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
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


String str1=cf.getItemData("select bzmc,bzmc||'��'||sq_bzxx.dh||'��',sq_bzxx.sgd from sq_bzxx,sq_sgd where sq_bzxx.sgd=sq_sgd.sgd and sq_sgd.ssfgs='"+fgsbh+"' order by sq_bzxx.sgd,sq_bzxx.bzmc ");
%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">


<form method="post" action="SaveEditSgdZjCrm_khxx.jsp" name="editform">
      <div align="center">�޸ģ�ʩ���ӹ��̵���</div>
          
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#0000FF">�ͻ����</font></div>
      </td>
      <td width="32%"><%=khbh%> </td>
      <td width="16%"> 
        <div align="right"><font color="#0000FF">��ͬ��</font></div>
      </td>
      <td width="34%"><%=hth%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#0000FF">�ͻ�����</font></div>
      </td>
      <td width="32%"> <%=khxm%> </td>
      <td width="16%" align="right"><font color="#0000FF">ǩԼ����</font></td>
      <td width="34%"><%=qyrq%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000FF">���ݵ�ַ</font></td>
      <td colspan="3"> <%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%"> 
        <div align="right"><font color="#0000FF">���ʦ</font></div>
      </td>
      <td width="32%"><%=sjs%> </td>
      <td width="16%"> 
        <div align="right"><font color="#0000FF">ǩԼ����</font></div>
      </td>
      <td width="34%"><%=dwmc%> </td>
    </tr>
    <tr bgcolor="#E8E8FF" align="center"> 
      <td colspan="4" height="29">�޸�������Ϣ</td>
    </tr>
    <tr> 
      <td width="18%" bgcolor="#FFFFCC" height="25"> 
        <div align="right">�ɵ�����</div>
      </td>
      <td width="32%" bgcolor="#FFFFCC" height="25"> <%
	cf.selectToken(out,"0+�˹��ɵ�&1+�ص�����&2+��˾����&3+���ʦָ���ɵ�&4+�ͻ�ָ���ɵ�&7+�������&9+ͬС���ɵ�",jlbz,true);
%> </td>
      <td width="16%" bgcolor="#FFFFCC" height="25">&nbsp;</td>
      <td width="34%" bgcolor="#FFFFCC" height="25">&nbsp;</td>
    </tr>
    <tr> 
      <td width="18%" bgcolor="#FFFFCC" height="25"> 
        <div align="right">�ɵ���</div>
      </td>
      <td width="32%" bgcolor="#FFFFCC" height="25"> <%=pdr%> </td>
      <td width="16%" bgcolor="#FFFFCC" height="25"> 
        <div align="right">�ɵ�ʱ��</div>
      </td>
      <td width="34%" bgcolor="#FFFFCC" height="25"> <%=pdsj%> </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td width="18%" align="right">���̵���</td>
      <td colspan="3"> 
        <select name="zjxm" style="FONT-SIZE:12PX;WIDTH:300PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select yhmc c1,yhmc||DECODE(sfzszg,'S','����ְ��','T','�����ˣ�','D','�����ڣ�','M','','N','','Y','')||'��'||dh||'��' c2,DECODE(sfzszg,'S','5','T','6','D','4','M','3','N','2','Y','1') c3 from sq_yhxx where zwbm='05' and ssfgs='"+fgsbh+"' order by c3,c2",zjxm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td width="18%" bgcolor="#E8E8FF" align="right">ʩ����</td>
      <td colspan="3"> 
        <select name="sgd" style="FONT-SIZE:12PX;WIDTH:300PX"  onChange="selectItem(sgd,sgbz,<%=str1%>)" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','���ѳ�����','N','')||'��'||dh||'��' from sq_sgd where ssfgs='"+fgsbh+"' order by cxbz,sgdmc",sgd);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#E8E8FF"> 
      <td width="18%"> 
        <div align="right">ʩ������</div>
      </td>
      <td colspan="3"> 
        <select name="sgbz" style="FONT-SIZE:12PX;WIDTH:300PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select bzmc,bzmc||'��'||dh||'��' from sq_bzxx where sgd='"+sgd+"' order by bzmc",sgbz);
%> 
        </select>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="hidden" name="oldsgd"  value="<%=sgd%>" >
        <input type="hidden" name="oldsgbz"  value="<%=sgbz%>" >
        <input type="hidden" name="oldzjxm"  value="<%=zjxm%>" >
        <input type="hidden" name="khbh"  value="<%=khbh%>" >
        <input type="button"  value="����" onClick="f_do(editform)">
        <input type="reset"  value="����">
      </td>
    </tr>
  </table>
</form>

	  

</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") 
	{
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
