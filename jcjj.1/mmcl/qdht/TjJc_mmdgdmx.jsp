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
String ctbs=null;
String tjx=null;
String dj=null;
String blxhbm=null;
String dczlbm=null;
String sfsmjcc=null;
String sfydc=null;
String dsk=null;
String bz=null;
String bzdj=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
String dqbm=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select dsk,yddbh,mmdglxbm,mlx,mmxh,sl,ysbm,czbm,azwzbm,kqfxbm,dbh,qh,mdk,mdg,ctbs,tjx,dj,bzdj,blxhbm,bz,dczlbm,sfsmjcc,sfydc ";
	ls_sql+=" from  jc_mmdgdmx";
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
		ctbs=cf.fillNull(rs.getString("ctbs"));
		tjx=cf.fillNull(rs.getString("tjx"));
		dj=cf.fillNull(rs.getString("dj"));
		bzdj=cf.fillNull(rs.getString("bzdj"));
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
      <div align="center">�޸�ľ�ż۸�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveTjJc_mmdgdmx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">Ԥ�������</div>              </td>
              <td width="28%"> 
                <input type="hidden" name="wherexh"  value="<%=wherexh%>" >
                <input type="text" name="yddbh" value="<%=yddbh%>" size="20" maxlength="9" readonly>              </td>
              <td width="20%"> 
                <div align="right">��������</div>              </td>
              <td width="30%"> 
                <select name="mmdglxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <%
	cf.selectItem(out,"select mmdglxbm,mmdglxmc from jc_mmdglx where mmdglxbm='"+mmdglxbm+"'",mmdglxbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">������</div>              </td>
              <td width="28%"> 
                <select name="mlx" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="tx(mlx);getDj(insertform)">
                  <%
	cf.selectItem(out,"select mlx,mlxmc||':'||tx from jdm_mlx where mlx='"+mlx+"'",mlx);
%> 
                </select>              </td>
              <td width="20%" bgcolor="#FFCCFF"> 
                <div align="right">ľ���ͺ�</div>              </td>
              <td width="30%" bgcolor="#FFCCFF"> 
                <select name="mmxh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <%
	cf.selectItem(out,"select mmxh,trim(mmxh)||'('||mxmc||','||myt||')' from jc_mmxhb,jdm_mxbm,jdm_mytbm where jc_mmxhb.mxbm=jdm_mxbm.mxbm and jc_mmxhb.mytbm=jdm_mytbm.mytbm and jc_mmxhb.dqbm='"+dqbm+"' and mmxh='"+mmxh+"'",mmxh);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" bgcolor="#FFCCFF"> 
                <div align="right">��ɫ</div>              </td>
              <td width="28%" bgcolor="#FFCCFF"> 
                <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <%
	cf.selectItem(out,"select mmczbm,mmczmc from jdm_mmczbm where mmczbm='"+ysbm+"'",ysbm);
%> 
                </select>              </td>
              <td width="20%"> 
                <div align="right">����</div>              </td>
              <td width="30%"> 
                <select name="czbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select czbm,czmc  from dm_czbm where czbm='"+czbm+"'",czbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">��װλ��</div>              </td>
              <td width="28%"> 
                <select name="azwzbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select azwzbm,azwzmc from jdm_azwzbm where azwzbm='"+azwzbm+"'",azwzbm);
%> 
                </select>              </td>
              <td width="20%"> 
                <div align="right">��������</div>              </td>
              <td width="30%"> 
                <select name="kqfxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select kqfxbm,kqfxmc from jdm_kqfxbm where kqfxbm='"+kqfxbm+"'",kqfxbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">�ز�����</td>
              <td width="28%"> 
                <select name="dczlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJg(dczlbm,dbh);getDj(insertform);">
                  <%
	cf.selectItem(out,"select dczlbm,dczlmc||'�����:'||dzhd from jdm_dczlbm where dczlbm='"+dczlbm+"'",dczlbm);
%> 
                </select>              </td>
              <td width="20%" align="right">�����ͺ�</td>
              <td width="30%"> 
                <select name="blxhbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select blxhbm,blxh from jc_blbj where blxhbm='"+blxhbm+"'",blxhbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right" bgcolor="#FFCCFF">��/��/ƽ̨�Ͽ�/����ǽ��</td>
              <td width="28%" bgcolor="#FFCCFF"> 
                <input type="text" name="qh" value="<%=qh%>" size="14" maxlength="8"  onChange="getDj(insertform)" readonly>
                ��mm�� </td>
              <td width="20%" align="right" bgcolor="#FFFFFF">�زĺ�</td>
              <td width="30%"> 
                <input type="text" name="dbh" value="<%=dbh%>" size="14" maxlength="8"  onChange="getDj(insertform)" readonly>
                ��mm�� </td>
            </tr>
            <tr bgcolor="#FFCCFF"> 
              <td width="22%"> 
                <div align="right">��/��/ƽ̨�Ͽ�/���ǿ�</div>              </td>
              <td width="28%"> 
                <input type="text" name="mdk" value="<%=mdk%>" size="14" maxlength="8"  onChange="getDj(insertform)" readonly>
                ��mm�� </td>
              <td width="20%"> 
                <div align="right">��/��/����/���Ǹ�</div>              </td>
              <td width="30%" bgcolor="#FFCCFF"> 
                <input type="text" name="mdg" value="<%=mdg%>" size="14" maxlength="8"  onChange="getDj(insertform)" readonly>
                ��mm�� ��<b><font color="#0000FF">�����زĺ�</font></b>�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">��˫��</td>
              <td width="28%"> <%
		cf.radioToken(out, "dsk","1+����&2+˫��",dsk,true);
%> </td>
              <td width="20%" align="right">&nbsp;</td>
              <td width="30%">&nbsp; </td>
            </tr>
            <tr> 
              <td width="22%" bgcolor="#FFFFFF" align="right">�Ƿ��ж���</td>
              <td width="28%" bgcolor="#FFFFFF"> <%
		cf.radioToken(out, "sfydc","Y+�ж���&N+�޶���",sfydc,true);
%></td>
              <td width="20%" bgcolor="#FFFFFF" align="right">����/�ƿڲ���</td>
              <td width="30%" bgcolor="#FFFFFF"> 
                <select name="sfsmjcc" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <%
	cf.selectToken(out,"Y+��ľ���ɲ�&N+����ľ���ɲ�",sfsmjcc,false);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">����/���ױ���</div>              </td>
              <td width="28%"> 
                <select name="ctbs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getDj(insertform)">
                  <%
	cf.selectToken(out,"3+����&4+�ı�",ctbs,false);
%> 
                </select>              </td>
              <td width="20%"> 
                <div align="right">�߽���</div>              </td>
              <td width="30%"> 
                <input type="text" name="tjx" value="<%=tjx%>" size="12" maxlength="8"  onChange="getDj(insertform)" readonly>
                ���� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">��������</div>              </td>
              <td width="28%"> 
                <input type="text" name="sl" value="<%=sl%>" size="20" maxlength="8" readonly>              </td>
              <td width="20%">&nbsp;                </td>
              <td width="30%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF3333">*</font><b>�ͻ�����<font color="#0000CC">��Ԫ��</font></b></td>
              <td><input type="text" name="dj" value="<%=dj%>" size="20" maxlength="9" ></td>
              <td align="right"><font color="#0000CC">��׼���ۣ�Ԫ��</font></td>
              <td><input type="text" name="bzdj" value="<%=bzdj%>" size="20" maxlength="9" readonly></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">��ע</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>              </td>
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
function tx(mlx)//����FormName:Form������
{
	var tx=getSubStr(mlx);
	if (tx!="")
	{
		alert("ע�⣡"+tx);
	}
}

function getDj(FormName)
{
	if (FormName.mmdglxbm.value=='')
	{
		return;
	}
	if (FormName.mmdglxbm.value=='01')//������
	{
		if (FormName.mdk.value=='')
		{
			return;
		}
		if (FormName.mdg.value=='')
		{
			return;
		}
		if (FormName.qh.value=='')
		{
			return;
		}
		if (FormName.dbh.value=='')
		{
			return;
		}

	}

	FormName.dj.value="";

	var str="Jc_mmydmxCx.jsp?mmdglxbm="+FormName.mmdglxbm.value+"&mlx="+FormName.mlx.value+"&dbh="+FormName.dbh.value;
	str+="&mmxh="+FormName.mmxh.value+"&ysbm="+FormName.ysbm.value+"&ctbs="+FormName.ctbs.value;
	str+="&mdk="+FormName.mdk.value+"&mdg="+FormName.mdg.value+"&qh="+FormName.qh.value+"&tjx="+FormName.tjx.value;
	str+="&sfsmjcc="+FormName.sfsmjcc.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yddbh)=="") {
		alert("������[Ԥ�������]��");
		FormName.yddbh.focus();
		return false;
	}

	if(	javaTrim(FormName.sl)=="" || FormName.sl.value=="0") {
		alert("������[��������]��");
		FormName.sl.focus();
		return false;
	}
	if(!(isNumber(FormName.sl, "��������"))) {
		return false;
	}
	if(	javaTrim(FormName.dj)=="" || FormName.dj.value=="0") {
		alert("[�ͻ�����]����Ϊ�գ�");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "�ͻ�����"))) {
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>

