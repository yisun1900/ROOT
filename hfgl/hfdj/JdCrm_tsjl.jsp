<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");

String crm_tsjl_tsjlh=null;
String dm_tslxbm_tslxmc=null;
String dm_slfsbm_slfsmc=null;
String dm_tsyybm_tsyymc=null;
String crm_tsjl_hth=null;
String crm_tsjl_khbh=null;
String crm_tsjl_khxm=null;
String crm_tsjl_fwdz=null;
String crm_tsjl_lxfs=null;
String crm_tsjl_sjs=null;
String crm_tsjl_sgd=null;
String crm_tsjl_zjy=null;
String crm_tsjl_jgrq=null;
String crm_tsjl_sfxhf=null;
String crm_tsjl_hfsj=null;
String crm_tsjl_slsj=null;
String crm_tsjl_slr=null;
String crm_tsjl_clzt=null;
String crm_tsjl_tsnr=null;
String crm_tsjl_yqjjsj=null;
String crm_tsjl_hfjlh=null;
String crm_tsjl_hfjgbm=null;
String crm_tsjl_zxhfsj=null;
String crm_tsjl_hfr=null;
String crm_tsjl_jsxbm=null;
String crm_tsjl_jasj=null;
String crm_tsjl_wxsgd=null;
String dm_zzjgbm_zzjgmc=null;
String yzcdmc=null;
String sffpsgd=null;
String slbm=null;
String sfjslx=null;
String bz=null;


String djbh=null;
String hfdjbz=null;
String djyy=null;
String djsj=null;
String djr=null;
String jhjdsj=null;
String sjjdsj=null;
String jdr=null;


String wherecrm_tsjl_tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select slbm,crm_tsjl.bz,yzcdmc,crm_tsjl.tsjlh as crm_tsjl_tsjlh,dm_slfsbm.slfsmc as dm_slfsbm_slfsmc,crm_khxx.hth as crm_tsjl_hth,crm_tsjl.khbh as crm_tsjl_khbh,crm_khxx.khxm as crm_tsjl_khxm,crm_khxx.fwdz as crm_tsjl_fwdz,crm_khxx.lxfs as crm_tsjl_lxfs,crm_khxx.sjs as crm_tsjl_sjs,crm_khxx.sgd as crm_tsjl_sgd,crm_khxx.zjxm as crm_tsjl_zjy,crm_khxx.jgrq as crm_tsjl_jgrq,crm_tsjl.sfxhf as crm_tsjl_sfxhf,crm_tsjl.hfsj as crm_tsjl_hfsj,crm_tsjl.slsj as crm_tsjl_slsj,crm_tsjl.slr as crm_tsjl_slr,crm_tsjl.clzt as crm_tsjl_clzt,crm_tsjl.tsnr as crm_tsjl_tsnr,crm_tsjl.yqjjsj as crm_tsjl_yqjjsj,crm_tsjl.hfjlh as crm_tsjl_hfjlh,crm_tsjl.zxhfsj as crm_tsjl_zxhfsj,crm_tsjl.hfr as crm_tsjl_hfr,crm_tsjl.jasj as crm_tsjl_jasj,crm_tsjl.wxsgd as crm_tsjl_wxsgd,crm_tsjl.djbh,crm_tsjl.hfdjbz,crm_tsjl.djyy,crm_tsjl.djsj,crm_tsjl.djr,crm_tsjl.jhjdsj,crm_tsjl.sjjdsj,crm_tsjl.jdr ";
	ls_sql+=" from  crm_tsjl,crm_khxx,dm_slfsbm,dm_yzcdbm";
	ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and  (crm_tsjl.tsjlh="+wherecrm_tsjl_tsjlh+")  ";
	ls_sql+=" and crm_tsjl.yzcdbm=dm_yzcdbm.yzcdbm(+) ";
	ls_sql+=" and crm_tsjl.khbh=crm_khxx.khbh";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		slbm=cf.fillNull(rs.getString("slbm"));
		bz=cf.fillNull(rs.getString("bz"));
		yzcdmc=cf.fillNull(rs.getString("yzcdmc"));
		crm_tsjl_tsjlh=cf.fillNull(rs.getString("crm_tsjl_tsjlh"));
		dm_slfsbm_slfsmc=cf.fillNull(rs.getString("dm_slfsbm_slfsmc"));
		crm_tsjl_hth=cf.fillNull(rs.getString("crm_tsjl_hth"));
		crm_tsjl_khbh=cf.fillNull(rs.getString("crm_tsjl_khbh"));
		crm_tsjl_khxm=cf.fillNull(rs.getString("crm_tsjl_khxm"));
		crm_tsjl_fwdz=cf.fillNull(rs.getString("crm_tsjl_fwdz"));
		crm_tsjl_lxfs=cf.fillNull(rs.getString("crm_tsjl_lxfs"));
		crm_tsjl_sjs=cf.fillNull(rs.getString("crm_tsjl_sjs"));
		crm_tsjl_sgd=cf.fillNull(rs.getString("crm_tsjl_sgd"));
		crm_tsjl_zjy=cf.fillNull(rs.getString("crm_tsjl_zjy"));
		crm_tsjl_jgrq=cf.fillNull(rs.getDate("crm_tsjl_jgrq"));
		crm_tsjl_sfxhf=cf.fillNull(rs.getString("crm_tsjl_sfxhf"));
		crm_tsjl_hfsj=cf.fillNull(rs.getDate("crm_tsjl_hfsj"));
		crm_tsjl_slsj=cf.fillNull(rs.getString("crm_tsjl_slsj"));
		crm_tsjl_slr=cf.fillNull(rs.getString("crm_tsjl_slr"));
		crm_tsjl_clzt=cf.fillNull(rs.getString("crm_tsjl_clzt"));
		crm_tsjl_tsnr=cf.fillNull(rs.getString("crm_tsjl_tsnr"));
		crm_tsjl_yqjjsj=cf.fillNull(rs.getDate("crm_tsjl_yqjjsj"));
		crm_tsjl_hfjlh=cf.fillNull(rs.getString("crm_tsjl_hfjlh"));
		crm_tsjl_zxhfsj=cf.fillNull(rs.getDate("crm_tsjl_zxhfsj"));
		crm_tsjl_hfr=cf.fillNull(rs.getString("crm_tsjl_hfr"));
		crm_tsjl_jasj=cf.fillNull(rs.getDate("crm_tsjl_jasj"));
		crm_tsjl_wxsgd=cf.fillNull(rs.getString("crm_tsjl_wxsgd"));

		djbh=cf.fillNull(rs.getString("djbh"));
		hfdjbz=cf.fillNull(rs.getString("hfdjbz"));
		djyy=cf.fillNull(rs.getString("djyy"));
		djsj=cf.fillNull(rs.getDate("djsj"));
		djr=cf.fillNull(rs.getString("djr"));
		jhjdsj=cf.fillNull(rs.getDate("jhjdsj"));
		sjjdsj=cf.fillNull(rs.getDate("sjjdsj"));
		jdr=cf.fillNull(rs.getString("jdr"));
	}
	else{
		out.println("������������Ż�ط��Ѷ���");
		return;
	}
	rs.close();
%>

<html>
<head>
<title>Ͷ�߱��޻طýⶳ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<div align="center">Ͷ�߱��޻طýⶳ</div>
<form method="post" action="SaveJdCrm_tsjl.jsp" name="selectform">
  <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFCC"> 
      <td align="right" width="22%">�Ƿ���ط�</td>
      <td width="28%"> 
        <input type="radio" name="sfxhf"  value="Y" <%if (crm_tsjl_sfxhf.equals("Y")) out.print("checked"); %>>
        ��ط� 
        <input type="radio" name="sfxhf"  value="N" onClick="f1(selectform)" <%if (!crm_tsjl_sfxhf.equals("Y")) out.print("checked"); %>>
        ����ط� </td>
      <td width="17%" align="right">�ط�����</td>
      <td width="33%"> 
        <input type="hidden" name="tsjlh" value="<%=wherecrm_tsjl_tsjlh%>" >
        <input type="text" name="hfsj" value="<%=crm_tsjl_hfsj%>" size="20" maxlength="10" >
      </td>
    </tr>
    <tr> 
      <td colspan="4" height="16"> 
        <div align="center"> 
          <input type="button"  value="����" name="butt" onClick="f_do(selectform)">
          <input type="reset" name="Submit2" value="����">
        </div>
      </td>
    </tr>
  </table>
</form>


<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFCC"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">�ͻ����</font></div>
    </td>
    <td width="32%"> <%=crm_tsjl_khbh%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">�ͻ�����</font></div>
    </td>
    <td width="33%"> <%=crm_tsjl_khxm%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">���ݵ�ַ</font></div>
    </td>
    <td width="32%" bgcolor="#FFFFCC"> <%=crm_tsjl_fwdz%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">��ϵ��ʽ</font></div>
    </td>
    <td width="33%"> <%=crm_tsjl_lxfs%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">���ʦ</font></div>
    </td>
    <td width="32%"> <%=crm_tsjl_sjs%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">ʩ����</font></div>
    </td>
    <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('3','8') order by dwbh",crm_tsjl_sgd,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">�ʼ�Ա</font></div>
    </td>
    <td width="32%" bgcolor="#FFFFCC"> <%=crm_tsjl_zjy%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">��������</font></div>
    </td>
    <td width="33%"> <%=crm_tsjl_jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">Ͷ�߼�¼��</font></div>
    </td>
    <td width="32%"> <%=crm_tsjl_tsjlh%> </td>
    <td width="17%" bgcolor="#FFFFCC"> 
      <div align="right"><font color="#006666">��ͬ��</font></div>
    </td>
    <td width="33%" bgcolor="#FFFFCC"><%=crm_tsjl_hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">����ʽ</font></div>
    </td>
    <td width="32%"> <%=dm_slfsbm_slfsmc%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">���س̶�</font></div>
    </td>
    <td width="33%"><%=yzcdmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#006666">Ͷ�߱�������</font></td>
    <td colspan="3"><%=crm_tsjl_tsnr%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">����ʱ��</font></div>
    </td>
    <td width="32%"><%=crm_tsjl_slsj%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">������</font></div>
    </td>
    <td width="33%"><%=crm_tsjl_slr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">�ͻ�Ҫ����ʱ��</font></div>
    </td>
    <td width="32%"><%=crm_tsjl_yqjjsj%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">������</font></div>
    </td>
    <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+slbm+"'",slbm,true);

%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="18%" align="right"><font color="#006666">����״̬</font></td>
    <td width="32%"><%
	cf.selectToken(out,"0+�ǿͷ��Ǽ�&1+�ͷ�����&2+�ڴ���&3+�᰸",crm_tsjl_clzt,true);
%></td>
    <td width="17%" align="right"><font color="#006666">�᰸ʱ��</font></td>
    <td width="33%"><%=crm_tsjl_jasj%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="18%" align="right">�Ƿ�ʱ��ϵ</td>
    <td width="32%"> <%
	cf.selectToken(out,"Y+��ʱ��ϵ&N+δ��ʱ��ϵ",sfjslx,true);
%> </td>
    <td width="17%" align="right"><font color="#006666">������⼰ʱ��</font></td>
    <td width="33%"><%
	cf.selectItem(out,"select jsxbm,jsxmc from dm_jsxbm order by jsxbm",crm_tsjl_jsxbm,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="18%" align="right">&nbsp;</td>
    <td width="32%">&nbsp;</td>
    <td width="17%" align="right"><font color="#006666">ά��ʩ����</font></td>
    <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='3' order by dwbh",crm_tsjl_wxsgd,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">�Ƿ���ط�</font></div>
    </td>
    <td width="32%"><%
	cf.radioToken(out, "Y+��ط�&N+����ط�",crm_tsjl_sfxhf,true);
%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">��ط�ʱ��</font></div>
    </td>
    <td width="33%"><%=crm_tsjl_hfsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">���»طü�¼��</font></div>
    </td>
    <td width="32%"> <%=crm_tsjl_hfjlh%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">���»طý��</font></div>
    </td>
    <td width="33%"> <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm order by hfjgbm",crm_tsjl_hfjgbm,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%"> 
      <div align="right"><font color="#006666">���»ط�ʱ��</font></div>
    </td>
    <td width="32%"> <%=crm_tsjl_zxhfsj%> </td>
    <td width="17%"> 
      <div align="right"><font color="#006666">���»ط���</font></div>
    </td>
    <td width="33%"> <%=crm_tsjl_hfr%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="15%"> 
      <div align="right">�طö����־</div>
    </td>
    <td width="35%"> <%
	cf.selectToken(out,"Y+�طö���&N+δ����",hfdjbz,true);
%></td>
    <td width="15%"> 
      <div align="right">���¶�����</div>
    </td>
    <td width="35%"><%=djbh%> </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="15%" align="right">����ԭ��</td>
    <td colspan="3"><%=djyy%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="15%" align="right">����ʱ��</td>
    <td width="35%"><%=djsj%></td>
    <td width="15%" align="right">������</td>
    <td width="35%"><%=djr%></td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="15%"> 
      <div align="right">�ƻ��ⶳʱ��</div>
    </td>
    <td width="35%"><%=jhjdsj%> </td>
    <td width="15%"> 
      <div align="right"></div>
    </td>
    <td width="35%">&nbsp; </td>
  </tr>
  <tr bgcolor="#CCFFCC"> 
    <td width="15%"> 
      <div align="right">ʵ�ʽⶳʱ��</div>
    </td>
    <td width="35%"> <%=sjjdsj%> </td>
    <td width="15%"> 
      <div align="right">�ⶳ��</div>
    </td>
    <td width="35%"> <%=jdr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="18%" align="right"><font color="#006666">��ע</font></td>
    <td colspan="3"><%=bz%></td>
  </tr>
</table>

        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF" align="center"> 
            <td width="12%"> 
              <div align="center"><font color="#006666">�漰����</font></div>
            </td>
            <td width="62%"> 
              <div align="center"><font color="#006666">�������</font></div>
            </td>
            <td width="16%"> 
              <div align="center"><font color="#006666">����ʱ��</font></div>
            </td>
            <td width="10%"> 
              <div align="center"><font color="#006666">������</font></div>
            </td>
          </tr>
          <%
	String dwmc=null;
	String clqk=null;
	String clsj=null;
	String clr=null;

	ls_sql="select dwmc,clqk,clsj,clr";
	ls_sql+=" from  crm_tsbm,sq_dwxx";
	ls_sql+=" where crm_tsbm.dwbh=sq_dwxx.dwbh and tsjlh='"+wherecrm_tsjl_tsjlh+"'";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	while (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
		clqk=cf.fillNull(rs.getString("clqk"));
		clsj=cf.fillNull(rs.getDate("clsj"));
		clr=cf.fillNull(rs.getString("clr"));
%> 
          <tr bgcolor="#FFFFFF"> 
            <td align="center"><%=dwmc%></td>
            <td><%=clqk%></td>
            <td align="center"><%=clsj%></td>
            <td align="center"><%=clr%></td>
          </tr>
          <%
	}
	rs.close();
%> 
        </table>
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF" align="center"> 
            <td width="12%"> 
              <div align="center"><font color="#006666">�ط�ʱ��</font></div>
            </td>
            <td width="62%"> 
              <div align="center"><font color="#006666">�ͻ��ط����</font></div>
            </td>
            <td width="26%"> 
              <div align="center"><font color="#006666">�ط��г��ֵ�������</font></div>
            </td>
          </tr>
          <%
	String khhfqk=null;
	String cxxwt=null;
	String hfsj=null;

	ls_sql="select hfsj,khhfqk,cxxwt";
	ls_sql+=" from  crm_tshfjl";
	ls_sql+=" where khbh='"+crm_tsjl_khbh+"'";
	rs =stmt.executeQuery(ls_sql);
	while (rs.next())
	{
		khhfqk=cf.fillNull(rs.getString("khhfqk"));
		cxxwt=cf.fillNull(rs.getString("cxxwt"));
		hfsj=cf.fillNull(rs.getString("hfsj"));
%> 
          <tr bgcolor="#FFFFFF"> 
            <td align="center" ><%=hfsj%></td>
            <td ><%=khhfqk%></td>
            <td ><%=cxxwt%></td>
          </tr>
          <%
	}
	rs.close();
%> 
        </table>


</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
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

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f1(FormName)//����FormName:Form������
{
	if (FormName.sfxhf[0].checked)
	{
	}
	else{
		FormName.hfsj.value='';
	}
}
function f_do(FormName)//����FormName:Form������
{
	if(	!radioChecked(FormName.sfxhf)) {
		alert("��ѡ��[�Ƿ���ط�]��");
		FormName.sfxhf[0].focus();
		return false;
	}

	if (FormName.sfxhf[0].checked)
	{
		if(	javaTrim(FormName.hfsj)=="") {
			alert("��ѡ��[�ط�����]��");
			FormName.hfsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.hfsj, "�ط�����"))) {
			return false;
		}
	}

	FormName.submit();
	return true;
}

//-->
</SCRIPT>
