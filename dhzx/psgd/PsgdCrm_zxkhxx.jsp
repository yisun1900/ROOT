<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String fwlxbm=null;
String hxbm=null;
String fwmj=null;
String fgyqbm=null;
String zxysbm=null;
String zxdm=null;
String sbyybm=null;
String sfxhf=null;
String hfrq=null;
String hdbz=null;
String khlxbm=null;
String bz=null;
String sjsbh=null;

String cqbm=null;
String cgdz=null;
String hdr=null;
String zxzt=null;
String zxdjbm=null;

String ssfgs=null;
String sgd=null;
String zjxm=null;
String khjl=null;
String sjs=null;
String ywy=null;
String dwmc=null;

String qtqk="";

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select crm_zxkhxx.ssfgs,sgd,zjxm,khjl,sjs,ywy,dwmc,sjsbh,DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','���ʦ�ύ�ɵ�','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��') zxzt,zxdjbm,khxm,xb,fwdz,lxfs,fwlxbm,hxbm,fwmj,fgyqbm,zxysbm,zxdm,sbyybm,sfxhf,hfrq,hdbz,khlxbm,crm_zxkhxx.bz,cqbm,cgdz,hdr ";
	ls_sql+=" from  crm_zxkhxx,sq_dwxx";
	ls_sql+=" where  crm_zxkhxx.zxdm=sq_dwxx.dwbh(+) and khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		khjl=cf.fillNull(rs.getString("khjl"));
		sjs=cf.fillNull(rs.getString("sjs"));
		ywy=cf.fillNull(rs.getString("ywy"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		zxzt=cf.fillNull(rs.getString("zxzt"));
		zxdjbm=cf.fillNull(rs.getString("zxdjbm"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwlxbm=cf.fillNull(rs.getString("fwlxbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		fgyqbm=cf.fillNull(rs.getString("fgyqbm"));
		zxysbm=cf.fillNull(rs.getString("zxysbm"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		sbyybm=cf.fillNull(rs.getString("sbyybm"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));

		cqbm=cf.fillNull(rs.getString("cqbm"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
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

%>

<html>
<head>
<title>��ʩ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center">��ʩ����</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

          
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"> 
              �ͻ�����            </td>
            <td width="32%"> <%=khxm%> </td>
            <td width="18%" align="right"> 
              �Ա�            </td>
            <td width="32%"> <%
	cf.radioToken(out, "xb","M+��&W+Ů",xb,true);
%> </td>
          </tr>
          
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"> 
              ���ݵ�ַ            </td>
            <td colspan="3"> <%=fwdz%> </td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right">��ѯ����</td>
            <td><%=dwmc%></td>
            <td align="right">���ʦ</td>
            <td><%=sjs%></td>
          </tr>
          <tr bgcolor="#FFFFFF">
            <td align="right">�ͻ�����</td>
            <td><%=khjl%></td>
            <td align="right">ҵ��Ա</td>
            <td><%=ywy%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"> 
              ��������            </td>
            <td width="32%"> <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm",fwlxbm,true);
%> </td>
            <td width="18%" align="right"> 
              ����            </td>
            <td width="32%"> <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"> 
              ���ڽ������            </td>
            <td width="32%" bgcolor="#FFFFFF"> <%=fwmj%> </td>
            <td width="18%" align="right"> 
              ���Ҫ��            </td>
            <td width="32%"> <%
	cf.selectItem(out,"select fgyqbm,fgyqmc from dm_fgyqbm order by fgyqbm",fgyqbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"> 
              װ��Ԥ��            </td>
            <td width="32%"><%
	cf.selectItem(out,"select zxysbm,zxysmc from dm_zxysbm order by zxysbm",zxysbm,true);
%> </td>
            <td width="18%" align="right"> 
              ��ϵ�ͻ�            </td>
            <td width="32%"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right" bgcolor="#FFFFFF"> 
              �ص���־            </td>
            <td width="32%" bgcolor="#FFFFFF"><%
	cf.selectToken(out,"1+�ǻص�&2+���ʦ�ص�&3+ʩ���ӻص�&4+�Ͽͻ��ص�&5+Ա���ص�&6+�೤�ص�&7+��¥��&8+������&9+����",hdbz,true);
%> </td>
            <td width="18%" align="right"> 
              �ص���            </td>
            <td width="32%"><%=hdr%></td>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right">�ص�װ�޵�ַ</td>
            <td colspan="3"><%=cgdz%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right">��ѯ״̬</td>
            <td width="32%"><%=zxzt%> </td>
            <td width="18%" align="right">��ѯ�Ǽǲ���</td>
            <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdjbm+"'",zxdjbm,true);
			%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="18%" align="right"> 
              ��ע            </td>
            <td colspan="3"> <%=bz%> </td>
          </tr>
      </table>
		  
<form method="post" action="SavePsgdCrm_zxkhxx.jsp" name="editform">
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"><span class="STYLE1">*</span>ʩ����</td>
              <td width="82%">
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:352PX"  >
                  <option value=""></option>
                  <%
	String sgdStr =" select sq_sgd.sgd,sq_sgd.sgdmc||'��'||sq_sgd.dh||'��'||'��'||sq_sgd.kjdsm||'����'||DECODE(sq_sgd.sgdlx,'S0','��ֱ����','S1','ֱ����')||'��'  ";
	sgdStr+=" from sq_sgd ";
	sgdStr+=" where sq_sgd.ssfgs='"+ssfgs+"' ";
	sgdStr+=" and sq_sgd.cxbz='N' and (sq_sgd.tdbz='N' OR (sq_sgd.tdbz='Y' and (sq_sgd.tdkssj>SYSDATE OR SYSDATE>sq_sgd.tdzzsj)) ) ";
	sgdStr+=" order by sq_sgd.sgdlx desc,sq_sgd.sgdmc";

	cf.selectItem(out,sgdStr,sgd);
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><span class="STYLE1">*</span>�ʼ�</td>
              <td><select name="zjxm" style="FONT-SIZE:12PX;WIDTH:352PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yhmc,yhmc||'��'||dh||'��' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='05' and sfzszg in('Y','N') order by yhmc",zjxm);
%>
              </select></td>
            </tr>
            <tr> 
              <td colspan="2" align="center"> 
                             
            <input type="hidden" name="khbh"  value="<%=khbh%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">                                           
                <input type="reset"  value="����">			  </td>
            </tr>
          </table>
</form>

	  
	  
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
	if(	javaTrim(FormName.sgd)=="") {
		alert("������[ʩ����]��");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.zjxm)=="") {
		alert("������[�ʼ�]��");
		FormName.zjxm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
