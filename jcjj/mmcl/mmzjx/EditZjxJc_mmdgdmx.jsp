<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%

String yddbh=null;
String mmdglxbm=null;
String mlx=null;
String mmxh=null;
String sl=null;
String zjhsl=null;
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
String blxh=null;
String dczlbm=null;
String sfsmjcc=null;
String sfydc=null;
String dsk=null;
String bz=null;
String mtxbm=null;
String mxxbm=null;
String wherexh=cf.GB2Uni(request.getParameter("xh"));
String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select yddbh,mtxbm,mxxbm,dsk,mmdglxbm,mlx,mmxh,sl,zjhsl,ysbm,czbm,azwzbm,kqfxbm,dbh,qh,mdk,mdg,ctbs,tjx,dj,blxh,bz,dczlbm,sfsmjcc,sfydc ";
	ls_sql+=" from  jc_mmdgdmx";
	ls_sql+=" where  (xh="+wherexh+")  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		yddbh=cf.fillNull(rs.getString("yddbh"));
		mtxbm=cf.fillNull(rs.getString("mtxbm"));
		mxxbm=cf.fillNull(rs.getString("mxxbm"));
		dsk=cf.fillNull(rs.getString("dsk"));
		mmdglxbm=cf.fillNull(rs.getString("mmdglxbm"));
		mlx=cf.fillNull(rs.getString("mlx"));
		mmxh=cf.fillNull(rs.getString("mmxh"));
		sl=cf.fillNull(rs.getString("sl"));
		zjhsl=cf.fillNull(rs.getString("zjhsl"));
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
		blxh=cf.fillNull(rs.getString("blxh"));
		bz=cf.fillNull(rs.getString("bz"));
		dczlbm=cf.fillNull(rs.getString("dczlbm"));
		sfsmjcc=cf.fillNull(rs.getString("sfsmjcc"));
		sfydc=cf.fillNull(rs.getString("sfydc"));
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
      <div align="center">�޸�ľ����������ϸ����������ţ�<%=zjxxh%>����ע�⣺<font color="#FF6699">��ɫ����</font>��Ӱ�쵽�۸�</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditZjxJc_mmdgdmx.jsp" name="insertform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">Ԥ�������</div>
              </td>
              <td width="32%"> <%=yddbh%></td>
              <td width="20%"> 
                <div align="right">��������</div>
              </td>
              <td width="30%"> <%
	cf.selectItem(out,"select mmdglxbm,mmdglxmc from jc_mmdglx order by mmdglxbm",mmdglxbm,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> ������</td>
              <td colspan="3"> <%
	cf.selectItem(out,"select mlx,mlxmc||':'||tx from jdm_mlx order by mlx",mlx,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="18%">ľ���ͺ�</td>
              <td colspan="3"><%
	cf.selectItem(out,"select mmxh,trim(mmxh)||'('||mxmc||','||myt||')' from jc_mmxhb,jdm_mxbm,jdm_mytbm where jc_mmxhb.mxbm=jdm_mxbm.mxbm and jc_mmxhb.mytbm=jdm_mytbm.mytbm order by mmxh",mmxh,true);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> ����</td>
              <td width="32%"> <%
	cf.selectItem(out,"select mmczbm,mmczmc from jdm_mmczbm order by mmczbm",ysbm,true);
%> </td>
              <td width="20%" align="right">��ɫ </td>
              <td width="30%"> <%
	cf.selectItem(out,"select czbm,czmc  from dm_czbm order by czbm",czbm,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> ��װλ��</td>
              <td width="32%"> <%
	cf.selectItem(out,"select azwzbm,azwzmc from jdm_azwzbm order by azwzbm",azwzbm,true);
%> </td>
              <td width="20%" align="right"> ��������</td>
              <td width="30%"> <%
	cf.selectItem(out,"select kqfxbm,kqfxmc from jdm_kqfxbm order by kqfxbm",kqfxbm,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="18%" align="right">������</td>
              <td width="32%"> <%
	cf.selectItem(out,"select mtxbm,mtxmc from jdm_mtxbm ",mtxbm,true);
%> </td>
              <td width="20%" align="right">��о��</td>
              <td width="30%"> <%
	cf.selectItem(out,"select mxxbm,mxxmc from jdm_mxxbm ",mxxbm,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�ز�����</td>
              <td width="32%"> <%
	cf.selectItem(out,"select dczlbm,dczlmc||'�����:'||dzhd from jdm_dczlbm order by dczlbm",dczlbm,true);
%> </td>
              <td width="20%" align="right">�����ͺ�</td>
              <td width="30%"> <%=blxh%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF">ǽ��mm��</td>
              <td width="32%" bgcolor="#FFFFFF"> <%=qh%> </td>
              <td width="20%" align="right" bgcolor="#FFFFFF">�زĺ�mm��</td>
              <td width="30%"> <%=dbh%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�Ŷ���mm��</div>
              </td>
              <td width="32%"> <%=mdk%> </td>
              <td width="20%"> 
                <div align="right">�Ŷ��ߣ�mm��</div>
              </td>
              <td width="30%"> <%=mdg%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF">��˫��</td>
              <td width="32%"> <%
		cf.radioToken(out, "dsk","1+����&2+˫��",dsk,true);
%> </td>
              <td width="20%" align="right"><font color="#0000CC">���ۣ�Ԫ��</font></td>
              <td width="30%"> <%=dj%> </td>
            </tr>
            <tr> 
              <td width="18%" bgcolor="#FFFFFF" align="right">�Ƿ��ж���</td>
              <td width="32%" bgcolor="#FFFFFF"><%
		cf.radioToken(out, "sfydc","Y+�ж���&N+�޶���",sfydc,true);
%> </td>
              <td width="20%" bgcolor="#FFFFFF" align="right">����/�ƿڲ���</td>
              <td width="30%" bgcolor="#FFFFFF"> <%
	cf.selectToken(out,"Y+��ľ���ɲ�&N+����ľ���ɲ�",sfsmjcc,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right">����/���ױ���</div>
              </td>
              <td width="32%"> <%
	cf.selectToken(out,"3+����&4+�ı�",ctbs,true);
%> </td>
              <td width="20%"> 
                <div align="right">�߽���</div>
              </td>
              <td width="30%"> <%=tjx%> ����/ƽ�� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��ע</td>
              <td colspan="3"> <%=bz%> </td>
            </tr>
            <tr bgcolor="#FFCCFF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>����������</div>
              </td>
              <td width="32%"> 
                <input type="text" name="zjhsl" value="<%=zjhsl%>" size="10" maxlength="8" >
              </td>
              <td width="20%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#CC0000">*</font><font color="#0000CC">��ͬ����</font></div>
              </td>
              <td width="30%" bgcolor="#FFFFFF"> 
                <input type="text" name="sl" value="<%=sl%>" size="10" maxlength="8" readonly>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value="����" onClick="f_do(insertform)">
                <input type="reset"  value="����" name="reset">
                <input type="hidden" name="wherexh"  value="<%=wherexh%>" >
                <input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
                <input type="hidden" name="yddbh" value="<%=yddbh%>" >
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

	if(	javaTrim(FormName.zjhsl)=="") {
		alert("������[����������]��");
		FormName.zjhsl.focus();
		return false;
	}
	if(!(isNumber(FormName.zjhsl, "����������"))) {
		return false;
	}
	if (parseInt(FormName.zjhsl.value)<0)
	{
		alert("[����������]����С��0��");
		FormName.zjhsl.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
