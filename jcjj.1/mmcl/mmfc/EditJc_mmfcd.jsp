<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>�޸�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%

String yddbh=null;
String mmdglxbm=null;
String mlx=null;
String mmxh=null;
String sl=null;
String ysbm=null;
String czbm=null;
String azwzbm=null;
String kqfxbm=null;
String dbh=null;
String qh=null;
String mdk=null;
String mdg=null;
String msk=null;
String msg=null;
String ctbs=null;
String tjx=null;
String dj=null;
String blxhbm=null;
String dczlbm=null;
String sfsmjcc=null;
String sfydc=null;
String dsk=null;
String bz=null;

String wherexh=cf.GB2Uni(request.getParameter("xh"));
String dqbm=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dsk,yddbh,mmdglxbm,mlx,mmxh,sl,ysbm,czbm,azwzbm,kqfxbm,dbh,qh,mdk,mdg,msk,msg,ctbs,tjx,dj,blxhbm,bz,dczlbm,sfsmjcc,sfydc ";
	ls_sql+=" from  jc_mmfcd";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dsk=cf.fillNull(rs.getString("dsk"));
		yddbh=cf.fillNull(rs.getString("yddbh"));
		mmdglxbm=cf.fillNull(rs.getString("mmdglxbm"));
		mlx=cf.fillNull(rs.getString("mlx"));
		mmxh=cf.fillNull(rs.getString("mmxh"));
		sl=cf.fillNull(rs.getString("sl"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		czbm=cf.fillNull(rs.getString("czbm"));
		azwzbm=cf.fillNull(rs.getString("azwzbm"));
		kqfxbm=cf.fillNull(rs.getString("kqfxbm"));
		dbh=cf.fillNull(rs.getString("dbh"));
		qh=cf.fillNull(rs.getString("qh"));
		mdk=cf.fillNull(rs.getString("mdk"));
		mdg=cf.fillNull(rs.getString("mdg"));
		msk=cf.fillNull(rs.getString("msk"));
		msg=cf.fillNull(rs.getString("msg"));
		ctbs=cf.fillNull(rs.getString("ctbs"));
		tjx=cf.fillNull(rs.getString("tjx"));
		dj=cf.fillNull(rs.getString("dj"));
		blxhbm=cf.fillNull(rs.getString("blxhbm"));
		bz=cf.fillNull(rs.getString("bz"));
		dczlbm=cf.fillNull(rs.getString("dczlbm"));
		sfsmjcc=cf.fillNull(rs.getString("sfsmjcc"));
		sfydc=cf.fillNull(rs.getString("sfydc"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm ";
	ls_sql+=" from jc_mmydd,sq_dwxx ";
	ls_sql+=" where jc_mmydd.fgsbh=sq_dwxx.dwbh and jc_mmydd.yddbh='"+yddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
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

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">�޸�ľ�ų��ⵥ��<font color="#FF6699">ע�⣺��ɫ���ֲ����޸�</font>��</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditJc_mmfcd.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right"><font color="#0000CC">Ԥ�������</font></div>
              </td>
              <td width="29%"> 
                <input type="hidden" name="wherexh"  value="<%=wherexh%>" >
                <input type="text" name="yddbh" value="<%=yddbh%>" size="20" maxlength="9" readonly>
              </td>
              <td width="19%"> 
                <div align="right"><font color="#0000CC">*��������</font></div>
              </td>
              <td width="31%"> 
                <select name="mmdglxbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select mmdglxbm,mmdglxmc from jc_mmdglx order by mmdglxbm",mmdglxbm,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right"><font color="#0000CC">*������</font></div>
              </td>
              <td width="29%" bgcolor="#FFFFFF"> 
                <select name="mlx" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select mlx,mlxmc from jdm_mlx order by mlx",mlx,false);
%> 
                </select>
              </td>
              <td width="19%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000CC">����</font></div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <select name="czbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select czbm,czmc  from dm_czbm order by czbm",czbm,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" bgcolor="#FFCCFF" align="right"><font color="#0000CC">ľ���ͺ�</font></td>
              <td colspan="3" bgcolor="#FFCCFF"> 
                <select name="mmxh" style="FONT-SIZE:12PX;WIDTH:452PX" >
                  <%
	cf.selectItem(out,"select mmxh,trim(mmxh)||'('||mxmc||','||myt||')' from jc_mmxhb,jdm_mxbm,jdm_mytbm where jc_mmxhb.mxbm=jdm_mxbm.mxbm and jc_mmxhb.mytbm=jdm_mytbm.mytbm and jc_mmxhb.dqbm='"+dqbm+"' order by mmxh",mmxh,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" bgcolor="#FFCCFF"> 
                <div align="right"><font color="#0000CC">��ɫ</font></div>
              </td>
              <td colspan="3" bgcolor="#FFCCFF"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:452PX" >
                  <%
	cf.selectItem(out,"select mmczbm,mmczmc from jdm_mmczbm order by mmczbm",ysbm,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right"><font color="#0000CC">*��װλ��</font></div>
              </td>
              <td width="29%"> 
                <select name="azwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select azwzbm,azwzmc from jdm_azwzbm order by azwzbm",azwzbm,false);
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right"><font color="#0000CC">*��������</font></div>
              </td>
              <td width="31%"> 
                <select name="kqfxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select kqfxbm,kqfxmc from jdm_kqfxbm order by kqfxbm",kqfxbm,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"><font color="#0000CC">*�ز�����</font></td>
              <td width="29%"> 
                <select name="dczlbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectItem(out,"select dczlbm,dczlmc||'�����:'||dzhd from jdm_dczlbm order by dczlbm",dczlbm,false);
%> 
                </select>
              </td>
              <td width="19%" align="right"><font color="#0000CC">�����ͺ�</font></td>
              <td width="31%"> 
                <select name="blxhbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select blxhbm,blxh from jc_blbj order by blxhbm",blxhbm,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#FFCCFF"><font color="#FF0000">*</font>��/��/ƽ̨�Ͽ�/����ǽ��</td>
              <td width="29%" bgcolor="#FFCCFF"> 
                <input type="text" name="qh" value="<%=qh%>" size="14" maxlength="8" >
                ��mm�� </td>
              <td width="19%" align="right">�زĺ�</td>
              <td width="31%"> 
                <input type="text" name="dbh" value="<%=dbh%>" size="14" maxlength="8"  >
                ��mm�� </td>
            </tr>
            <tr bgcolor="#FFCCFF"> 
              <td width="21%"> 
                <div align="right"><font color="#FF0000">*</font>��/��/ƽ̨�Ͽ�/���ǿ�</div>
              </td>
              <td width="29%"> 
                <input type="text" name="mdk" value="<%=mdk%>" size="14" maxlength="8"  >
                ��mm�� </td>
              <td width="19%"> 
                <div align="right"><font color="#FF0000">*</font>��/��/����/���Ǹ�</div>
              </td>
              <td width="31%" bgcolor="#FFCCFF"> 
                <input type="text" name="mdg" value="<%=mdg%>" size="14" maxlength="8"  >
                ��mm�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"><font color="#0000CC">��˫��</font></td>
              <td width="29%"> <%
		cf.radioToken(out, "dsk","1+����&2+˫��",dsk);
%> </td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr> 
              <td width="21%" bgcolor="#FFFFFF" align="right"><font color="#0000CC">���Ƿ��ж���</font></td>
              <td width="29%" bgcolor="#FFFFFF"> <%
		cf.radioToken(out, "sfydc","Y+�ж���&N+�޶���",sfydc);
%> </td>
              <td width="19%" bgcolor="#FFFFFF" align="right"><font color="#0000CC">����/�ƿڲ���</font></td>
              <td width="31%" bgcolor="#FFFFFF"> 
                <select name="sfsmjcc" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+��ľ���ɲ�&N+����ľ���ɲ�",sfsmjcc);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%"> 
                <div align="right"><font color="#0000CC">*����/���ױ���</font></div>
              </td>
              <td width="29%"> 
                <select name="ctbs" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectToken(out,"3+����&4+�ı�",ctbs);
%> 
                </select>
              </td>
              <td width="19%"> 
                <div align="right"><font color="#0000FF">*</font>�߽���</div>
              </td>
              <td width="31%"> 
                <input type="text" name="tjx" value="<%=tjx%>" size="12" maxlength="8" >
                ����</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"><font color="#0000CC">*��������</font></td>
              <td width="29%"> 
                <input type="text" name="sl" value="<%=sl%>" size="20" maxlength="8" >
              </td>
              <td width="19%" align="right">&nbsp;</td>
              <td width="31%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"><font color="#0000CC">��ע</font></td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
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

	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}
	if(	javaTrim(FormName.mmdglxbm)=="") {
		alert("��ѡ��[ľ�Ŷ�������]��");
		FormName.mmdglxbm.focus();
		return false;
	}

	if (FormName.mmdglxbm.value=="01")//������
	{
		if(	javaTrim(FormName.dbh)=="") {
			alert("������[�زĺ�]��");
			FormName.dbh.focus();
			return false;
		}
		if(!(isNumber(FormName.dbh, "�زĺ�"))) {
			return false;
		}

		if(	javaTrim(FormName.qh)=="") {
			alert("������[ǽ��]��");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "ǽ��"))) {
			return false;
		}
		if(	javaTrim(FormName.mdk)=="") {
			alert("������[��/������]��");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "��/������"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("������[��/������]��");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "��/������"))) {
			return false;
		}
	}
	else if (FormName.mmdglxbm.value=="41" )//41:�߽���
	{
		if(	javaTrim(FormName.tjx)=="") {
			alert("������[�߽���]��");
			FormName.tjx.focus();
			return false;
		}
		if(!(isFloat(FormName.tjx, "�߽���"))) {
			return false;
		}
	}
	else if (FormName.mmdglxbm.value=="42")//42:��Ʈ����ƽ̨�Ͽ�
	{
		if(	javaTrim(FormName.qh)=="") {
			alert("������[ƽ̨�Ͽ�ǽ��]��");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "ƽ̨�Ͽ�ǽ��"))) {
			return false;
		}
		if(	javaTrim(FormName.mdk)=="") {
			alert("������[ƽ̨�Ͽڿ�]��");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "ƽ̨�Ͽڿ�"))) {
			return false;
		}
	}
	else if (FormName.mmdglxbm.value=="15" || FormName.mmdglxbm.value=="16")//15:˫����Ʈ��������;16:������Ʈ��������
	{
		if(	javaTrim(FormName.qh)=="") {
			alert("������[����ǽ��]��");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "����ǽ��"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("������[���ڸ�]��");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "���ڸ�"))) {
			return false;
		}
	}
	else if (FormName.mmdglxbm.value=="51")//51:���ǣ��۽ǡ�������
	{
		if(	javaTrim(FormName.mdk)=="") {
			alert("������[���ǿ�]��");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "���ǿ�"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("������[���ǳ�]��");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "���ǳ�"))) {
			return false;
		}
	}
	else 
	{
		if(	javaTrim(FormName.qh)=="") {
			alert("������[ǽ��]��");
			FormName.qh.focus();
			return false;
		}
		if(!(isNumber(FormName.qh, "ǽ��"))) {
			return false;
		}
		if(	javaTrim(FormName.mdk)=="") {
			alert("������[�Ŷ���]��");
			FormName.mdk.focus();
			return false;
		}
		if(!(isNumber(FormName.mdk, "�Ŷ���"))) {
			return false;
		}
		if(	javaTrim(FormName.mdg)=="") {
			alert("������[�Ŷ���]��");
			FormName.mdg.focus();
			return false;
		}
		if(!(isNumber(FormName.mdg, "�Ŷ���"))) {
			return false;
		}
		if(	javaTrim(FormName.ctbs)=="") {
			alert("������[����/���ױ���]��");
			FormName.ctbs.focus();
			return false;
		}
	}


	FormName.submit();
	return true;
}
//-->
</SCRIPT>
