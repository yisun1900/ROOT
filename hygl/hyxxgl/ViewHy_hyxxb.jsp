<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String hy_hyxxb_hybh=null;
String hy_hyxxb_sfzf=null;
String hy_hyxxb_hymm=null;
String hy_hyxxb_hyxm=null;
String hy_hyxxb_xb=null;
String hy_hyxxb_yzbm=null;
String hy_hyxxb_hydz=null;
String hy_hyxxb_sfzhm=null;
String hy_hyxxb_dh=null;
String hy_hyxxb_sj=null;
String hy_hyxxb_dzxx=null;
String hy_hyxxb_csrq=null;
String hy_hyxxb_zydm=null;
String hy_hyxxb_ysrdm=null;
String hy_hyxxb_hyzk=null;
String hy_hyxxb_jhjnr=null;
String hy_hyxxb_arxm=null;
String hy_hyxxb_arsr=null;
String hy_hyxxb_jgyxbm=null;
String hy_hyxxb_fwyxbm=null;
String hy_hyxxb_fgyxbm=null;
String hy_hyxxb_gyyxbm=null;
String hy_hyxxb_zdfgbm=null;
String hy_hyxxb_psahbm=null;
String hy_hyxxb_bzzz=null;
String hy_hyxxb_sztlpp=null;
String hy_hyxxb_shop=null;
String hy_hyxxb_hzppp=null;
String hy_hyxxb_fzpp=null;
String sq_dwxx_dwmc=null;
String hy_hyxxb_rhrq=null;
String hy_hyxxb_yxrq=null;
String hy_hyxxb_hykh=null;
String hy_hyjbb_hyjb=null;
String hy_hyxxb_fwlx=null;
String hy_hyxxb_gmcs=null;
String hy_hyxxb_xfzje=null;
String hy_hyxxb_jf=null;
String hy_hyxxb_wdhjf=null;
String hy_hyxxb_xxlrr=null;
String hy_hyxxb_bz=null;
String wherehy_hyxxb_hybh=null;
wherehy_hyxxb_hybh=cf.GB2Uni(request.getParameter("hybh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select hy_hyxxb.hybh as hy_hyxxb_hybh,hy_hyxxb.sfzf as hy_hyxxb_sfzf,hy_hyxxb.hymm as hy_hyxxb_hymm,hy_hyxxb.hyxm as hy_hyxxb_hyxm,hy_hyxxb.xb as hy_hyxxb_xb,hy_hyxxb.yzbm as hy_hyxxb_yzbm,hy_hyxxb.hydz as hy_hyxxb_hydz,hy_hyxxb.sfzhm as hy_hyxxb_sfzhm,hy_hyxxb.dh as hy_hyxxb_dh,hy_hyxxb.sj as hy_hyxxb_sj,hy_hyxxb.dzxx as hy_hyxxb_dzxx,hy_hyxxb.csrq as hy_hyxxb_csrq,hy_hyxxb.zydm as hy_hyxxb_zydm,hy_hyxxb.ysrdm as hy_hyxxb_ysrdm,hy_hyxxb.hyzk as hy_hyxxb_hyzk,hy_hyxxb.jhjnr as hy_hyxxb_jhjnr,hy_hyxxb.arxm as hy_hyxxb_arxm,hy_hyxxb.arsr as hy_hyxxb_arsr,hy_hyxxb.jgyxbm as hy_hyxxb_jgyxbm,hy_hyxxb.fwyxbm as hy_hyxxb_fwyxbm,hy_hyxxb.fgyxbm as hy_hyxxb_fgyxbm,hy_hyxxb.gyyxbm as hy_hyxxb_gyyxbm,hy_hyxxb.zdfgbm as hy_hyxxb_zdfgbm,hy_hyxxb.psahbm as hy_hyxxb_psahbm,hy_hyxxb.bzzz as hy_hyxxb_bzzz,hy_hyxxb.sztlpp as hy_hyxxb_sztlpp,hy_hyxxb.shop as hy_hyxxb_shop,hy_hyxxb.hzppp as hy_hyxxb_hzppp,hy_hyxxb.fzpp as hy_hyxxb_fzpp,sq_dwxx.dwmc as sq_dwxx_dwmc,hy_hyxxb.rhrq as hy_hyxxb_rhrq,hy_hyxxb.yxrq as hy_hyxxb_yxrq,hy_hyxxb.hykh as hy_hyxxb_hykh,hy_hyjbb.hyjb as hy_hyjbb_hyjb,hy_hyxxb.fwlx as hy_hyxxb_fwlx,hy_hyxxb.gmcs as hy_hyxxb_gmcs,hy_hyxxb.xfzje as hy_hyxxb_xfzje,hy_hyxxb.jf as hy_hyxxb_jf,hy_hyxxb.wdhjf as hy_hyxxb_wdhjf,hy_hyxxb.xxlrr as hy_hyxxb_xxlrr,hy_hyxxb.bz as hy_hyxxb_bz ";
	ls_sql+=" from  hy_hyjbb,hy_hyxxb,sq_dwxx";
	ls_sql+=" where hy_hyxxb.dwbh=sq_dwxx.dwbh and hy_hyxxb.hyjb=hy_hyjbb.hyjbbh(+) and (hy_hyxxb.hybh='"+wherehy_hyxxb_hybh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		hy_hyxxb_hybh=cf.fillNull(rs.getString("hy_hyxxb_hybh"));
		hy_hyxxb_sfzf=cf.fillNull(rs.getString("hy_hyxxb_sfzf"));
		hy_hyxxb_hymm=cf.fillNull(rs.getString("hy_hyxxb_hymm"));
		hy_hyxxb_hyxm=cf.fillNull(rs.getString("hy_hyxxb_hyxm"));
		hy_hyxxb_xb=cf.fillNull(rs.getString("hy_hyxxb_xb"));
		hy_hyxxb_yzbm=cf.fillNull(rs.getString("hy_hyxxb_yzbm"));
		hy_hyxxb_hydz=cf.fillNull(rs.getString("hy_hyxxb_hydz"));
		hy_hyxxb_sfzhm=cf.fillNull(rs.getString("hy_hyxxb_sfzhm"));
		hy_hyxxb_dh=cf.fillNull(rs.getString("hy_hyxxb_dh"));
		hy_hyxxb_sj=cf.fillNull(rs.getString("hy_hyxxb_sj"));
		hy_hyxxb_dzxx=cf.fillNull(rs.getString("hy_hyxxb_dzxx"));
		hy_hyxxb_csrq=cf.fillNull(rs.getDate("hy_hyxxb_csrq"));
		hy_hyxxb_zydm=cf.fillNull(rs.getString("hy_hyxxb_zydm"));
		hy_hyxxb_ysrdm=cf.fillNull(rs.getString("hy_hyxxb_ysrdm"));
		hy_hyxxb_hyzk=cf.fillNull(rs.getString("hy_hyxxb_hyzk"));
		hy_hyxxb_jhjnr=cf.fillNull(rs.getDate("hy_hyxxb_jhjnr"));
		hy_hyxxb_arxm=cf.fillNull(rs.getString("hy_hyxxb_arxm"));
		hy_hyxxb_arsr=cf.fillNull(rs.getDate("hy_hyxxb_arsr"));
		hy_hyxxb_jgyxbm=cf.fillNull(rs.getString("hy_hyxxb_jgyxbm"));
		hy_hyxxb_fwyxbm=cf.fillNull(rs.getString("hy_hyxxb_fwyxbm"));
		hy_hyxxb_fgyxbm=cf.fillNull(rs.getString("hy_hyxxb_fgyxbm"));
		hy_hyxxb_gyyxbm=cf.fillNull(rs.getString("hy_hyxxb_gyyxbm"));
		hy_hyxxb_zdfgbm=cf.fillNull(rs.getString("hy_hyxxb_zdfgbm"));
		hy_hyxxb_psahbm=cf.fillNull(rs.getString("hy_hyxxb_psahbm"));
		hy_hyxxb_bzzz=cf.fillNull(rs.getString("hy_hyxxb_bzzz"));
		hy_hyxxb_sztlpp=cf.fillNull(rs.getString("hy_hyxxb_sztlpp"));
		hy_hyxxb_shop=cf.fillNull(rs.getString("hy_hyxxb_shop"));
		hy_hyxxb_hzppp=cf.fillNull(rs.getString("hy_hyxxb_hzppp"));
		hy_hyxxb_fzpp=cf.fillNull(rs.getString("hy_hyxxb_fzpp"));
		sq_dwxx_dwmc=cf.fillNull(rs.getString("sq_dwxx_dwmc"));
		hy_hyxxb_rhrq=cf.fillNull(rs.getDate("hy_hyxxb_rhrq"));
		hy_hyxxb_yxrq=cf.fillNull(rs.getDate("hy_hyxxb_yxrq"));
		hy_hyxxb_hykh=cf.fillNull(rs.getString("hy_hyxxb_hykh"));
		hy_hyjbb_hyjb=cf.fillNull(rs.getString("hy_hyjbb_hyjb"));
		hy_hyxxb_fwlx=cf.fillNull(rs.getString("hy_hyxxb_fwlx"));
		hy_hyxxb_gmcs=cf.fillNull(rs.getString("hy_hyxxb_gmcs"));
		hy_hyxxb_xfzje=cf.fillNull(rs.getString("hy_hyxxb_xfzje"));
		hy_hyxxb_jf=cf.fillNull(rs.getString("hy_hyxxb_jf"));
		hy_hyxxb_wdhjf=cf.fillNull(rs.getString("hy_hyxxb_wdhjf"));
		hy_hyxxb_xxlrr=cf.fillNull(rs.getString("hy_hyxxb_xxlrr"));
		hy_hyxxb_bz=cf.fillNull(rs.getString("hy_hyxxb_bz"));
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
<title>�鿴��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> �鿴��Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF"> 
            <td width="17%"> 
              <div align="right">��Ա���</div>
            </td>
            <td width="33%"> <%=hy_hyxxb_hybh%> </td>
            <td width="15%"> 
              <div align="right">�Ƿ�����</div>
            </td>
            <td width="35%"> <%
	cf.selectToken(out,"Y+����&N+δ����",hy_hyxxb_sfzf,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%" align="right">ˮ�ʷ�������</td>
            <td width="33%"><%=hy_hyxxb_hykh%></td>
            <td width="15%" align="right">����ר����</td>
            <td width="35%"><%=sq_dwxx_dwmc%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%"> 
              <div align="right">��Ա����</div>
            </td>
            <td width="33%"><%=hy_hyjbb_hyjb%> </td>
            <td width="15%"> 
              <div align="right">��������</div>
            </td>
            <td width="35%"><%
	cf.selectToken(out,"1+��������&2+��ֵ����",hy_hyxxb_fwlx,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%"> 
              <div align="right">�������</div>
            </td>
            <td width="33%"> <%=hy_hyxxb_rhrq%> </td>
            <td width="15%"> 
              <div align="right">��Ч����</div>
            </td>
            <td width="35%"> <%=hy_hyxxb_yxrq%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%"> 
              <div align="right">��Ա����</div>
            </td>
            <td width="33%"> <%=hy_hyxxb_hymm%> </td>
            <td width="15%"> 
              <div align="right">��Ϣ¼����</div>
            </td>
            <td width="35%"><%=hy_hyxxb_xxlrr%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%"> 
              <div align="right">��Ա����</div>
            </td>
            <td width="33%"><%=hy_hyxxb_hyxm%> </td>
            <td width="15%"> 
              <div align="right">�Ա�</div>
            </td>
            <td width="35%"><%
	cf.radioToken(out, "M+��&W+Ů",hy_hyxxb_xb,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%" align="right">��������</td>
            <td width="33%"><%=hy_hyxxb_yzbm%></td>
            <td width="15%" align="right">���֤����</td>
            <td width="35%"><%=hy_hyxxb_sfzhm%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%"> 
              <div align="right">��Ա��ַ</div>
            </td>
            <td colspan="3"> <%=hy_hyxxb_hydz%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%"> 
              <div align="right">�绰</div>
            </td>
            <td width="33%"> <%=hy_hyxxb_dh%> </td>
            <td width="15%"> 
              <div align="right">�ֻ�</div>
            </td>
            <td width="35%"> <%=hy_hyxxb_sj%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%"> 
              <div align="right">��������</div>
            </td>
            <td width="33%"> <%=hy_hyxxb_dzxx%> </td>
            <td width="15%"> 
              <div align="right">��������</div>
            </td>
            <td width="35%"> <%=hy_hyxxb_csrq%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%"> 
              <div align="right">ְҵ</div>
            </td>
            <td width="33%"> <%
	cf.selectItem(out,"select xh,zymc from hy_zydmb order by xh",hy_hyxxb_zydm,true);
%> </td>
            <td width="15%"> 
              <div align="right">������</div>
            </td>
            <td width="35%"> <%
	cf.selectItem(out,"select xh,ysrdm from hy_ysrdmb order by xh",hy_hyxxb_ysrdm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%"> 
              <div align="right">����״��</div>
            </td>
            <td width="33%"> <%
	cf.radioToken(out, "Y+�ѻ�&N+δ��",hy_hyxxb_hyzk,true);
%> </td>
            <td width="15%"> 
              <div align="right">��������</div>
            </td>
            <td width="35%"> <%=hy_hyxxb_jhjnr%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%"> 
              <div align="right">��������</div>
            </td>
            <td width="33%"> <%=hy_hyxxb_arxm%> </td>
            <td width="15%"> 
              <div align="right">��������</div>
            </td>
            <td width="35%"> <%=hy_hyxxb_arsr%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%"> 
              <div align="right">�۸�ӡ��</div>
            </td>
            <td width="33%"> <%
	cf.selectItem(out,"select jgyxbm,jgyxmc from hy_jgyxbm order by jgyxbm",hy_hyxxb_jgyxbm,true);
%> </td>
            <td width="15%"> 
              <div align="right">����ӡ��</div>
            </td>
            <td width="35%"> <%
	cf.selectItem(out,"select fwyxbm,fwyxmc from hy_fwyxbm order by fwyxbm",hy_hyxxb_fwyxbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%"> 
              <div align="right">���ӡ��</div>
            </td>
            <td width="33%"> <%
	cf.selectItem(out,"select fgyxbm,fgyxmc from hy_fgyxbm order by fgyxbm",hy_hyxxb_fgyxbm,true);
%> </td>
            <td width="15%"> 
              <div align="right">����ӡ��</div>
            </td>
            <td width="35%"> <%
	cf.selectItem(out,"select gyyxbm,gyyxmc from hy_gyyxbm order by gyyxbm",hy_hyxxb_gyyxbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%"> 
              <div align="right">ר����</div>
            </td>
            <td width="33%"> <%
	cf.selectItem(out,"select zdfgbm,zdfgmc from hy_zdfgbm order by zdfgbm",hy_hyxxb_zdfgbm,true);
%> </td>
            <td width="15%"> 
              <div align="right">ƽʱ����</div>
            </td>
            <td width="35%"> <%
	cf.selectItem(out,"select psahbm,psahmc  from hy_psahbm order by psahbm",hy_hyxxb_psahbm,true);
%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%"> 
              <div align="right">ϲ����ֽ��־</div>
            </td>
            <td colspan="3"> <%=hy_hyxxb_bzzz%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%" align="right">��֪ͬ��Ʒ��</td>
            <td colspan="3"><%=hy_hyxxb_sztlpp%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%"> 
              <div align="right">ϲ��ȥ���̵�</div>
            </td>
            <td colspan="3"> <%=hy_hyxxb_shop%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%" align="right">ϲ����ױƷƷ��</td>
            <td colspan="3"><%=hy_hyxxb_hzppp%></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%"> 
              <div align="right">ϲ����װƷ��</div>
            </td>
            <td colspan="3"> <%=hy_hyxxb_fzpp%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%"> 
              <div align="right">�����ܽ��</div>
            </td>
            <td width="33%"> <%=hy_hyxxb_xfzje%></td>
            <td width="15%"> 
              <div align="right">�������</div>
            </td>
            <td width="35%"><%=hy_hyxxb_gmcs%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%"> 
              <div align="right">����</div>
            </td>
            <td width="33%"><%=hy_hyxxb_jf%> </td>
            <td width="15%"> 
              <div align="right">δ�һ�����</div>
            </td>
            <td width="35%"><%=hy_hyxxb_wdhjf%> </td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="17%"> 
              <div align="right">��ע</div>
            </td>
            <td colspan="3"> <%=hy_hyxxb_bz%> </td>
          </tr>
        </table>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
