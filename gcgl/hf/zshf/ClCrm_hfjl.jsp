<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");

String crm_hfjl_hfjlh=null;
String dm_hflxbm_hflxmc=null;
String crm_hfjl_khbh=null;
String crm_hfjl_sjfa=null;
String crm_hfjl_hqfw=null;
String crm_hfjl_jdqk=null;
String crm_hfjl_zjyfw=null;
String crm_hfjl_zjydw=null;
String crm_hfjl_zjyjz=null;
String crm_hfjl_fwsz=null;
String crm_hfjl_sgzl=null;
String crm_hfjl_grsz=null;
String crm_hfjl_sjshfnr=null;
String crm_hfjl_zjyhfnr=null;
String crm_hfjl_sgdhfnr=null;
String crm_hfjl_sfjxhf=null;
String crm_hfjl_xchfrq=null;
String crm_hfjl_xchflxbm=null;
String crm_hfjl_clfs=null;
String crm_hfjl_hfsj=null;
String crm_hfjl_hfr=null;
String crm_hfjl_gcjdbm=null;
String crm_hfjl_clzt=null;
String crm_hfjl_clqk=null;
String crm_hfjl_clr=null;
String crm_hfjl_clsj=null;
String khxm=null;
String fwdz=null;
String dwbh=null;
String dwmc=null;
String clzt=null;
String xwtclqk=null;
String clr=null;
String clsj=null;

String jcjjsjs=null;
String jsjjgw=null;
String jcxmzy=null;
String jcshaz=null;
String jccpzl=null;
String jchfnr=null;

String wherehfjlh=cf.GB2Uni(request.getParameter("hfjlh"));
String wheredwbh=cf.GB2Uni(request.getParameter("dwbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();

	ls_sql="select khxm,fwdz,crm_hfjl.hfjlh as crm_hfjl_hfjlh,dm_hflxbm.hflxmc as dm_hflxbm_hflxmc,crm_hfjl.khbh as crm_hfjl_khbh,crm_hfjl.sjfa as crm_hfjl_sjfa,crm_hfjl.hqfw as crm_hfjl_hqfw,crm_hfjl.jdqk as crm_hfjl_jdqk,crm_hfjl.zjyfw as crm_hfjl_zjyfw,crm_hfjl.zjydw as crm_hfjl_zjydw,crm_hfjl.zjyjz as crm_hfjl_zjyjz,crm_hfjl.fwsz as crm_hfjl_fwsz,crm_hfjl.sgzl as crm_hfjl_sgzl,crm_hfjl.grsz as crm_hfjl_grsz,crm_hfjl.sjshfnr as crm_hfjl_sjshfnr,crm_hfjl.zjyhfnr as crm_hfjl_zjyhfnr,crm_hfjl.sgdhfnr as crm_hfjl_sgdhfnr,crm_hfjl.sfjxhf as crm_hfjl_sfjxhf,crm_hfjl.xchfrq as crm_hfjl_xchfrq,crm_hfjl.xchflxbm as crm_hfjl_xchflxbm,crm_hfjl.clfs as crm_hfjl_clfs,crm_hfjl.hfsj as crm_hfjl_hfsj,crm_hfjl.hfr as crm_hfjl_hfr,crm_hfjl.gcjdbm as crm_hfjl_gcjdbm,jcjjsjs,jsjjgw,jcxmzy,jcshaz,jccpzl,jchfnr";
	ls_sql+=" from  crm_hfjl,dm_hflxbm,crm_khxx";
	ls_sql+=" where crm_hfjl.hflxbm=dm_hflxbm.hflxbm and  (crm_hfjl.hfjlh="+wherehfjlh+")  ";
	ls_sql+=" and crm_hfjl.khbh=crm_khxx.khbh";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		crm_hfjl_hfjlh=cf.fillNull(rs.getString("crm_hfjl_hfjlh"));
		dm_hflxbm_hflxmc=cf.fillNull(rs.getString("dm_hflxbm_hflxmc"));
		crm_hfjl_khbh=cf.fillNull(rs.getString("crm_hfjl_khbh"));
		crm_hfjl_sjfa=cf.fillNull(rs.getString("crm_hfjl_sjfa"));
		crm_hfjl_hqfw=cf.fillNull(rs.getString("crm_hfjl_hqfw"));
		crm_hfjl_jdqk=cf.fillNull(rs.getString("crm_hfjl_jdqk"));
		crm_hfjl_zjyfw=cf.fillNull(rs.getString("crm_hfjl_zjyfw"));
		crm_hfjl_zjydw=cf.fillNull(rs.getString("crm_hfjl_zjydw"));
		crm_hfjl_zjyjz=cf.fillNull(rs.getString("crm_hfjl_zjyjz"));
		crm_hfjl_fwsz=cf.fillNull(rs.getString("crm_hfjl_fwsz"));
		crm_hfjl_sgzl=cf.fillNull(rs.getString("crm_hfjl_sgzl"));
		crm_hfjl_grsz=cf.fillNull(rs.getString("crm_hfjl_grsz"));
		crm_hfjl_sjshfnr=cf.fillNull(rs.getString("crm_hfjl_sjshfnr"));
		crm_hfjl_zjyhfnr=cf.fillNull(rs.getString("crm_hfjl_zjyhfnr"));
		crm_hfjl_sgdhfnr=cf.fillNull(rs.getString("crm_hfjl_sgdhfnr"));
		crm_hfjl_sfjxhf=cf.fillNull(rs.getString("crm_hfjl_sfjxhf"));
		crm_hfjl_xchfrq=cf.fillNull(rs.getDate("crm_hfjl_xchfrq"));
		crm_hfjl_xchflxbm=cf.fillNull(rs.getString("crm_hfjl_xchflxbm"));
		crm_hfjl_clfs=cf.fillNull(rs.getString("crm_hfjl_clfs"));
		crm_hfjl_hfsj=cf.fillNull(rs.getDate("crm_hfjl_hfsj"));
		crm_hfjl_hfr=cf.fillNull(rs.getString("crm_hfjl_hfr"));
		crm_hfjl_gcjdbm=cf.fillNull(rs.getString("crm_hfjl_gcjdbm"));

		jcjjsjs=cf.fillNull(rs.getString("jcjjsjs"));
		jsjjgw=cf.fillNull(rs.getString("jsjjgw"));
		jcxmzy=cf.fillNull(rs.getString("jcxmzy"));
		jcshaz=cf.fillNull(rs.getString("jcshaz"));
		jccpzl=cf.fillNull(rs.getString("jccpzl"));
		jchfnr=cf.fillNull(rs.getString("jchfnr"));
	}
	rs.close();

	ls_sql="select dwmc,clzt,xwtclqk,clr,clsj ";
	ls_sql+=" from  crm_gchffkbm,sq_dwxx";
	ls_sql+=" where  crm_gchffkbm.dwbh=sq_dwxx.dwbh and hfjlh="+wherehfjlh+" and crm_gchffkbm.dwbh='"+wheredwbh+"' ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
		clzt=cf.fillNull(rs.getString("clzt"));
		xwtclqk=cf.fillNull(rs.getString("xwtclqk"));
		clr=cf.fillNull(rs.getString("clr"));
		clsj=cf.fillNull(rs.getDate("clsj"));

		if (clr.equals(""))
		{
			clr=yhmc;
		}
		if (clsj.equals(""))
		{
			clsj=cf.today();
		}
	}
	rs.close();

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
<title>����ط�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center">��<%=dwmc%>������ط�����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveClCrm_hfjl.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�طü�¼��</div>
              </td>
              <td width="32%"> <%=crm_hfjl_hfjlh%> </td>
              <td width="18%"> 
                <div align="right">�ط�����</div>
              </td>
              <td width="32%"> <%=dm_hflxbm_hflxmc%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�ͻ����</div>
              </td>
              <td width="32%"> <%=crm_hfjl_khbh%> </td>
              <td width="18%"> 
                <div align="right">�ͻ�����</div>
              </td>
              <td width="32%"><%=khxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">���ݵ�ַ</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">���ʦ��Ʒ���</td>
              <td width="32%"><%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",crm_hfjl_sjfa,true);
%></td>
              <td width="18%" align="right">���ʦ���ڷ���</td>
              <td width="32%"><%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",crm_hfjl_hqfw,true);
%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">���ʦ�������</div>
              </td>
              <td width="32%"><%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",crm_hfjl_jdqk,true);
%> </td>
              <td width="18%"> 
                <div align="right"></div>
              </td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">���ʦ�ط�����</td>
              <td colspan="3"><%=crm_hfjl_sjshfnr%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%"> 
                <div align="right">���̵�������</div>
              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",crm_hfjl_zjyfw,true);
%> </td>
              <td width="18%"> 
                <div align="right">���̵�����λ</div>
              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",crm_hfjl_zjydw,true);
%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%"> 
                <div align="right">���̵�������</div>
              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",crm_hfjl_zjyjz,true);
%> </td>
              <td width="18%"> 
                <div align="right"></div>
              </td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">���̵����ط�����</td>
              <td colspan="3"><%=crm_hfjl_zjyhfnr%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">ʩ���ӷ���̬��</td>
              <td width="32%"><%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",crm_hfjl_fwsz,true);
%></td>
              <td width="18%" align="right">ʩ����ʩ������</td>
              <td width="32%"><%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",crm_hfjl_sgzl,true);
%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">ʩ���ӹ�������</div>
              </td>
              <td width="32%"><%
	cf.selectItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",crm_hfjl_grsz,true);
%> </td>
              <td width="18%"> 
                <div align="right"></div>
              </td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%"> 
                <div align="right">ʩ���ӻط�����</div>
              </td>
              <td colspan="3"> <%=crm_hfjl_sgdhfnr%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF">�Ҿ����ʦ</td>
              <td width="31%"><%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",jcjjsjs,true);
%></td>
              <td width="17%" align="right">&nbsp;</td>
              <td width="34%">&nbsp;</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF">��ĿרԱ</td>
              <td width="31%"><%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",jcxmzy,true);
%></td>
              <td width="17%" align="right">�Ҿӹ���</td>
              <td width="34%"><%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",jsjjgw,true);
%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF">�ͻ���װ</td>
              <td width="31%"><%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",jcshaz,true);
%></td>
              <td width="17%" align="right">��Ʒ����</td>
              <td width="34%"><%
	cf.radioItem(out,"select hfjgbm,hfjgmc from dm_hfjgbm where hfdl='2' order by hfjgbm",jccpzl,true);
%></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" bgcolor="#E8E8FF">���ɼҾӻط�����</td>
              <td colspan="3"><%=jchfnr%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">�ط�ʱ��</div>
              </td>
              <td width="32%"> <%=crm_hfjl_hfsj%> </td>
              <td width="18%"> 
                <div align="right">�ط���</div>
              </td>
              <td width="32%"> <%=crm_hfjl_hfr%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">����ʽ</div>
              </td>
              <td width="32%"><%
	cf.selectToken(out,"0+���账��&1+������ز���",crm_hfjl_clfs,true);
%> </td>
              <td width="18%"> 
                <div align="right">���̽���</div>
              </td>
              <td width="32%"><%
	cf.selectItem(out,"select gcjdbm,gcjdmc from dm_gcjdbm order by gcjdbm",crm_hfjl_gcjdbm,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%" align="right">��ز��Ŵ������</td>
              <td colspan="3"> 
                <textarea name="xwtclqk" cols="69" rows="3"><%=xwtclqk%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="22%"> 
                <div align="right">������</div>
              </td>
              <td width="28%"> 
                <input type="text" name="clr" size="20" maxlength="20"  value="<%=clr%>" readonly>
              </td>
              <td width="21%"> 
                <div align="right">����ʱ��</div>
              </td>
              <td width="29%"> 
                <input type="text" name="clsj" size="20" maxlength="10"  value="<%=clsj%>" readonly>
                <input type="hidden" name="wherehfjlh"  value="<%=wherehfjlh%>" >
                <input type="hidden" name="wheredwbh"  value="<%=wheredwbh%>" >
              </td>
            </tr>
            <tr> 
              <td width="22%" height="2">&nbsp;</td>
              <td width="28%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="����" onClick="f_do(editform)">
                </div>
              </td>
              <td width="21%" height="2">&nbsp;</td>
              <td width="29%" height="2"> 
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
	if(	javaTrim(FormName.xwtclqk)=="") {
		alert("��ѡ��[��ز��Ŵ������]��");
		FormName.xwtclqk.focus();
		return false;
	}
	if(	javaTrim(FormName.clr)=="") {
		alert("��ѡ��[������]��");
		FormName.clr.focus();
		return false;
	}
	if(	javaTrim(FormName.clsj)=="") {
		alert("��ѡ��[����ʱ��]��");
		FormName.clsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.clsj, "����ʱ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
