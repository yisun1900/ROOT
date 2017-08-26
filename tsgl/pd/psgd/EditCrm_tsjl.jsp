<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));

String slfsbm=null;
String yqjjsj=null;
String slsj=null;
String tsnr=null;
String lx=null;
String lxmc=null;
String clzt=null;
String zrbmclzt=null;
String jasj=null;
String wxsgd=null;
String bz=null;


String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qyrq=null;
String dwbh=null;
String sgd=null;
String zjxm=null;

String wxfl=null;
String ysgd=null;
String ysgdsflz=null;
String sfhsgd=null;
String pdsgd=null;
String hsgdyy =null;
String ssfgs=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

try {
	conn=cf.getConnection();

	ls_sql="select tsjlh,khbh,slfsmc,slsj,yqjjsj,tsnr,lx,DECODE(lx,'1','Ͷ��','2','����') lxmc,clzt,zrbmclzt,jasj,wxsgd,bz";
	ls_sql+=" ,crm_tsjl.hsgdyy,crm_tsjl.sfhsgd,crm_tsjl.pdsgd,crm_tsjl.ysgd,crm_tsjl.ysgdsflz,crm_tsjl.wxfl ";
	ls_sql+=" from  crm_tsjl,dm_slfsbm";
	ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and crm_tsjl.tsjlh='"+tsjlh+"'";
	ls_sql+="  order by tsjlh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hsgdyy=cf.fillNull(rs.getString("hsgdyy"));
		sfhsgd=cf.fillNull(rs.getString("sfhsgd"));
		pdsgd=cf.fillNull(rs.getString("pdsgd"));
		ysgd=cf.fillNull(rs.getString("ysgd"));
		ysgdsflz=cf.fillNull(rs.getString("ysgdsflz"));
		wxfl=cf.fillNull(rs.getString("wxfl"));
		tsjlh=cf.fillHtml(rs.getString("tsjlh"));
		khbh=cf.fillHtml(rs.getString("khbh"));
		slfsbm=cf.fillHtml(rs.getString("slfsmc"));
		yqjjsj=cf.fillHtml(rs.getDate("yqjjsj"));
		slsj=cf.fillHtml(rs.getDate("slsj"));
		tsnr=cf.fillHtml(rs.getString("tsnr"));
		lx=cf.fillHtml(rs.getString("lx"));
		lxmc=cf.fillHtml(rs.getString("lxmc"));
		clzt=cf.fillHtml(rs.getString("clzt"));
		zrbmclzt=cf.fillHtml(rs.getString("zrbmclzt"));
		jasj=cf.fillHtml(rs.getDate("jasj"));
		wxsgd=cf.fillNull(rs.getString("wxsgd"));
		bz=cf.fillHtml(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	
	
	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qyrq,dwbh,sgd,zjxm,crm_khxx.fgsbh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
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
<title>����ά��ʩ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">����ά��ʩ���� </div>
<form method="post" action="SaveEditCrm_tsjl.jsp" name="editform">
  <table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
    <tr bgcolor="#FFFFCC"> 
      <td width="18%" align="right">�ͻ����</td>
      <td width="33%"><%=khbh%></td>
      <td width="19%" align="right">��ͬ��</td>
      <td width="33%"><%=hth%></td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="18%"> 
        <div align="right">�ͻ�����</div>      </td>
      <td width="33%"> <%=khxm%>��<%=lxfs%>�� </td>
      <td width="19%"> 
        <div align="right">ǩԼ����</div>      </td>
      <td width="33%"><%=qyrq%> </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="18%" align="right">���ݵ�ַ</td>
      <td colspan="3"><%=fwdz%></td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="18%"> 
        <div align="right">ǩԼ����</div>      </td>
      <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
      <td width="19%"> 
        <div align="right">���ʦ</div>      </td>
      <td width="33%"><%=sjs%> </td>
    </tr>
    <tr bgcolor="#FFFFCC"> 
      <td width="18%" bgcolor="#FFFFCC"> 
        <div align="right">�ʼ�</div>      </td>
      <td width="33%"> <%=zjxm%> </td>
      <td width="19%"> 
        <div align="right">ʩ����&nbsp;</div>      </td>
      <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sgd+"'",sgd,true);
%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">�᰸״̬</td>
      <td width="33%"><%
	cf.selectToken(out,"0+δ����&1+������&2+�ڴ���&3+�᰸&9+������",clzt,true);
%></td>
      <td rowspan="7" align="right">��������</td>
      <td rowspan="7"><%=tsnr%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">�᰸ʱ��</td>
      <td width="33%"><%=jasj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">���β��Ŵ���״̬</td>
      <td width="33%"><%
	cf.selectToken(out,"1+δ����&2+�ڴ���&3+�ѽ��",zrbmclzt,true);
%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">����</td>
      <td width="33%"><%=lxmc%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">Ͷ����Դ</td>
      <td width="33%"><%=slfsbm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">����ʱ��</td>
      <td width="33%"><%=slsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">Ҫ����ʱ��</td>
      <td width="33%"><%=yqjjsj%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right">��ע</td>
      <td colspan="3"><%=bz%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="27" align="right" bgcolor="#FFFFCC"><font color="#0000CC">ԭʩ����</font></td>
      <td bgcolor="#FFFFCC"><%=ysgd%></td>
      <td align="right" bgcolor="#FFFFCC"><font color="#0000CC">ԭʩ�����Ƿ���ְ</font></td>
      <td bgcolor="#FFFFCC"><%
					cf.radioToken(out,"Y+��ְ&N+��",ysgdsflz,true);
				%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td height="27" align="right" bgcolor="#FFFFCC"><font color="#0000CC">ά�޷���</font></td>
      <td bgcolor="#FFFFCC"><%
					cf.radioToken(out,"1+����&2+�Ǳ���",wxfl,true);
				%></td>
      <td align="right" bgcolor="#FFFFCC">&nbsp;</td>
      <td bgcolor="#FFFFCC">&nbsp;</td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFCC"><font color="#FF0033">*</font>�Ƿ���ʩ����</td>
      <td bgcolor="#FFFFCC"><%
					cf.radioToken(out, "sfhsgd","Y+��ʩ����&N+ԭʩ����&T+����ʩ����",sfhsgd);
				%></td>
      <td align="right" bgcolor="#FFFFCC">ά��ʩ����</td>
      <td bgcolor="#FFFFCC"><select name="pdsgd" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	   cf.selectItem(out,"select sgd,sgdmc from sq_sgd where cxbz='N' and ssfgs='"+ssfgs+"' order by sgdmc",pdsgd);
%>
      </select></td>
    </tr>
    <tr>
      <td align="right" bgcolor="#FFFFCC">��ʩ����ԭ��</td>
      <td colspan="3" bgcolor="#FFFFCC"><textarea name="hsgdyy" cols="87" rows="3" ><%=hsgdyy%></textarea></td>
    </tr>
    
    <tr> 
      <td colspan="4" align="center"> 
		<input type="hidden" name="tsjlh"  value="<%=tsjlh%>" >
        <input type="hidden" name="ysgd" value="<%=ysgd%>" >
          <input type="button"  value="����" onClick="f_do(editform)">
      <input type="reset"  value="����"></td>
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
	if(	!radioChecked(FormName.sfhsgd)) {
		alert("��ѡ��[�Ƿ���ʩ����]��");
		FormName.sfhsgd[0].focus();
		return false;
	}

	if (FormName.sfhsgd[0].checked)
	{
		if(	javaTrim(FormName.hsgdyy)=="") {
			alert("������[��ʩ����ԭ��]��");
			FormName.hsgdyy.focus();
			return false;
		}
	}
	else{
		FormName.hsgdyy.value="";
	}

	if(	javaTrim(FormName.pdsgd)=="") {
		alert("������[ά��ʩ����]��");
		FormName.pdsgd.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
