<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String ls_sql=null;
	String wheresql="";
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	String sq_gysbm_gys=null;
	String sq_gyslxr_lxrxm=null;
	String sq_gyslxr_zw=null;
	String sq_gyslxr_sj=null;
	String sq_gyslxr_bgdh=null;
	String sq_gyslxr_cz=null;
	String sq_gyslxr_sflz=null;

	String sq_gysxx_dqbm=null;
	sq_gysxx_dqbm=request.getParameter("sq_gysxx_dqbm");
	if (sq_gysxx_dqbm!=null)
	{
		sq_gysxx_dqbm=cf.GB2Uni(sq_gysxx_dqbm);
		if (!(sq_gysxx_dqbm.equals("")))	wheresql+=" and  (sq_gysxx.dqbm='"+sq_gysxx_dqbm+"')";
	}

	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (sq_gysxx.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql+=" and  (sq_gysxx.ppmc like '%"+ppmc2+"%')";
	}
	String sq_gysxx_gyslb=null;
	String sq_gysxx_zclb=null;
	sq_gysxx_gyslb=request.getParameter("sq_gysxx_gyslb");
	if (sq_gysxx_gyslb!=null)
	{
		sq_gysxx_gyslb=cf.GB2Uni(sq_gysxx_gyslb);
		if (!(sq_gysxx_gyslb.equals("")))	wheresql+=" and  (sq_gysxx.gyslb='"+sq_gysxx_gyslb+"')";
	}
	sq_gysxx_zclb=request.getParameter("sq_gysxx_zclb");
	if (sq_gysxx_zclb!=null)
	{
		sq_gysxx_zclb=cf.GB2Uni(sq_gysxx_zclb);
		if (!(sq_gysxx_zclb.equals("")))	wheresql+=" and  (sq_gysxx.zclb='"+sq_gysxx_zclb+"')";
	}
	
	sq_gysbm_gys=request.getParameter("sq_gysbm_gys");
	if (sq_gysbm_gys!=null)
	{
		sq_gysbm_gys=cf.GB2Uni(sq_gysbm_gys);
		if (!(sq_gysbm_gys.equals("")))	wheresql+=" and  (sq_gysbm.gys like '%"+sq_gysbm_gys+"%')";
	}
	sq_gyslxr_lxrxm=request.getParameter("sq_gyslxr_lxrxm");
	if (sq_gyslxr_lxrxm!=null)
	{
		sq_gyslxr_lxrxm=cf.GB2Uni(sq_gyslxr_lxrxm);
		if (!(sq_gyslxr_lxrxm.equals("")))	wheresql+=" and  (sq_gyslxr.lxrxm like '%"+sq_gyslxr_lxrxm+"%')";
	}
	sq_gyslxr_zw=request.getParameter("sq_gyslxr_zw");
	if (sq_gyslxr_zw!=null)
	{
		sq_gyslxr_zw=cf.GB2Uni(sq_gyslxr_zw);
		if (!(sq_gyslxr_zw.equals("")))	wheresql+=" and  (sq_gyslxr.zw like '%"+sq_gyslxr_zw+"%')";
	}
	sq_gyslxr_sj=request.getParameter("sq_gyslxr_sj");
	if (sq_gyslxr_sj!=null)
	{
		sq_gyslxr_sj=cf.GB2Uni(sq_gyslxr_sj);
		if (!(sq_gyslxr_sj.equals("")))	wheresql+=" and  (sq_gyslxr.sj like '%"+sq_gyslxr_sj+"%')";
	}
	sq_gyslxr_bgdh=request.getParameter("sq_gyslxr_bgdh");
	if (sq_gyslxr_bgdh!=null)
	{
		sq_gyslxr_bgdh=cf.GB2Uni(sq_gyslxr_bgdh);
		if (!(sq_gyslxr_bgdh.equals("")))	wheresql+=" and  (sq_gyslxr.bgdh like '%"+sq_gyslxr_bgdh+"%')";
	}
	sq_gyslxr_cz=request.getParameter("sq_gyslxr_cz");
	if (sq_gyslxr_cz!=null)
	{
		sq_gyslxr_cz=cf.GB2Uni(sq_gyslxr_cz);
		if (!(sq_gyslxr_cz.equals("")))	wheresql+=" and  (sq_gyslxr.cz='"+sq_gyslxr_cz+"')";
	}
	sq_gyslxr_sflz=request.getParameter("sq_gyslxr_sflz");
	if (sq_gyslxr_sflz!=null)
	{
		sq_gyslxr_sflz=cf.GB2Uni(sq_gyslxr_sflz);
		if (!(sq_gyslxr_sflz.equals("")))	wheresql+=" and  (sq_gyslxr.sflz='"+sq_gyslxr_sflz+"')";
	}

	ls_sql="SELECT distinct dqmc,sq_gysbm.gys,sq_gyslxr.lxrxm,sq_gyslxr.zw,sq_gyslxr.sj,sq_gyslxr.bgdh,sq_gyslxr.cz, DECODE(sq_gyslxr.sflz,'Y','��','N','��'),sq_gyslxr.bz ";
	ls_sql+=" FROM sq_dwxx,sq_gyslxr,sq_gysbm,sq_gysxx,dm_dqbm  ";
    ls_sql+=" where sq_gyslxr.gysbm=sq_gysbm.gysbm(+)";
    ls_sql+=" and sq_gysbm.gysbm=sq_gysxx.gysbm(+) and sq_gysbm.dqbm=dm_dqbm.dqbm";
    ls_sql+=wheresql;
    ls_sql+=" order by dqmc,sq_gysbm.gys,sq_gyslxr.lxrxm";
    pageObj.sql=ls_sql;
//	out.println(ls_sql);
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(40000);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("dqmc","1");//�в����������Hash��
	spanColHash.put("gys","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��Ӧ����ϵ��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printPageLink(140);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">����</td>
	<td  width="12%">��Ӧ������</td>
	<td  width="6%">��ϵ��</td>
	<td  width="12%">ְ��</td>
	<td  width="14%">�ֻ�</td>
	<td  width="18%">�칫�绰</td>
	<td  width="8%">����</td>
	<td  width="5%">�Ƿ���ְ</td>
	<td  width="11%">��ע</td>
</tr>
<%
	pageObj.printDate();
	pageObj.printFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>