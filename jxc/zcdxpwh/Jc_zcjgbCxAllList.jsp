<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String jc_zcjgb_clbm=null;
	String jc_zcjgb_clmc=null;
	String cldlbm=null;
	String jc_zcjgb_xh=null;
	String jc_zcjgb_gg=null;
	String jc_zcjgb_lsj=null;
	String jc_zcjgb_xsj=null;
	String jc_zcjgb_zp=null;
	String cllbbm=null;
	String jc_zcjgb_clysbm=null;
	String jc_zcjgb_jldwbm=null;
	String jc_zcjgb_sfbhpj=null;
	String jc_zcjgb_pjts=null;

	String sftjcp=null;
	sftjcp=request.getParameter("sftjcp");
	if (sftjcp!=null)
	{
		sftjcp=cf.GB2Uni(sftjcp);
		if (!(sftjcp.equals("")))	wheresql+=" and  (jc_zcjgb.sftjcp='"+sftjcp+"')";
	}

	
	
	String xhlist[]=request.getParameterValues("xhlist");
	jc_zcjgb_xh=request.getParameter("jc_zcjgb_xh");

	String mhcx=request.getParameter("mhcx");
	if (mhcx.equals("Y"))
	{
		if (xhlist!=null)
		{
			String lsxh="";
			String getxh="";
			for (int i=0;i<xhlist.length ;i++ )
			{
				getxh=cf.GB2Uni(xhlist[i]);
				lsxh+=" or (jc_zcjgb.xh like '%"+getxh+"%')";
			}
			wheresql+=" and  ("+lsxh.substring(3)+")";
		}
		else{
			if (jc_zcjgb_xh!=null)
			{
				jc_zcjgb_xh=cf.GB2Uni(jc_zcjgb_xh);
				if (!(jc_zcjgb_xh.equals("")))	wheresql+=" and  (jc_zcjgb.xh like '%"+jc_zcjgb_xh+"%')";
			}
		}
	}
	else{
		if (xhlist!=null)
		{
			String lsxh="";
			String getxh="";
			for (int i=0;i<xhlist.length ;i++ )
			{
				getxh=cf.GB2Uni(xhlist[i]);
				lsxh+=" or (jc_zcjgb.xh='"+getxh+"')";
			}
			wheresql+=" and  ("+lsxh.substring(3)+")";
		}
		else{
			if (jc_zcjgb_xh!=null)
			{
				jc_zcjgb_xh=cf.GB2Uni(jc_zcjgb_xh);
				if (!(jc_zcjgb_xh.equals("")))	wheresql+=" and  (jc_zcjgb.xh='"+jc_zcjgb_xh+"')";
			}
		}
	}

	String cxhdbl=null;
	cxhdbl=request.getParameter("cxhdbl");
	if (cxhdbl!=null)
	{
		cxhdbl=cf.GB2Uni(cxhdbl);
		if (!(cxhdbl.equals("")))	wheresql+=" and  (jc_zcjgb.cxhdbl>="+cxhdbl+")";
	}
	String clxlbm=null;
	clxlbm=request.getParameter("clxlbm");
	if (clxlbm!=null)
	{
		clxlbm=cf.GB2Uni(clxlbm);
		if (!(clxlbm.equals("")))	wheresql+=" and  (jc_zcjgb.clxlbm='"+clxlbm+"')";
	}
	cxhdbl=request.getParameter("cxhdbl2");
	if (cxhdbl!=null)
	{
		cxhdbl=cf.GB2Uni(cxhdbl);
		if (!(cxhdbl.equals("")))	wheresql+=" and  (jc_zcjgb.cxhdbl<="+cxhdbl+")";
	}

	String dqbm=null;
	dqbm=request.getParameter("dqbm");
	if (!(dqbm.equals("")))	wheresql+=" and  (jc_zcjgb.dqbm='"+dqbm+"')";

	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jc_zcjgb.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql+=" and  (jc_zcjgb.ppmc like '%"+ppmc2+"%')";
	}
	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (jc_zcjgb.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql+=" and  (jc_zcjgb.ppmc like '%"+ppmc2+"%')";
	}
	String gysmc=null;
	gysmc=request.getParameter("gysmc");
	if (gysmc!=null)
	{
		gysmc=cf.GB2Uni(gysmc);
		if (!(gysmc.equals("")))	wheresql+=" and  (jc_zcjgb.gysmc='"+gysmc+"')";
	}
	String gysmc2=null;
	gysmc2=request.getParameter("gysmc2");
	if (gysmc2!=null)
	{
		gysmc2=cf.GB2Uni(gysmc2);
		if (!(gysmc2.equals("")))	wheresql+=" and  (jc_zcjgb.gysmc like '%"+gysmc2+"%')";
	}



	String sfyh=null;
	sfyh=request.getParameter("sfyh");
	if (sfyh!=null)
	{
		if (!(sfyh.equals("")))	wheresql+=" and  (jc_zcjgb.sfyh='"+sfyh+"')";
	}

	String sfycx=null;
	sfycx=request.getParameter("sfycx");
	if (sfycx!=null)
	{
		if (!(sfycx.equals("")))	wheresql+=" and  (jc_zcjgb.sfycx='"+sfycx+"')";
	}
	String cxkssj=null;
	cxkssj=request.getParameter("cxkssj");
	if (cxkssj!=null)
	{
		if (!(cxkssj.equals("")))	wheresql+="  and (jc_zcjgb.cxkssj>=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	cxkssj=request.getParameter("cxkssj2");
	if (cxkssj!=null)
	{
		if (!(cxkssj.equals("")))	wheresql+="  and (jc_zcjgb.cxkssj<=TO_DATE('"+cxkssj+"','YYYY/MM/DD'))";
	}
	String cxjzsj=null;
	cxjzsj=request.getParameter("cxjzsj");
	if (cxjzsj!=null)
	{
		if (!(cxjzsj.equals("")))	wheresql+="  and (jc_zcjgb.cxjzsj>=TO_DATE('"+cxjzsj+"','YYYY/MM/DD'))";
	}
	cxjzsj=request.getParameter("cxjzsj2");
	if (cxjzsj!=null)
	{
		if (!(cxjzsj.equals("")))	wheresql+="  and (jc_zcjgb.cxjzsj<=TO_DATE('"+cxjzsj+"','YYYY/MM/DD'))";
	}

	jc_zcjgb_clbm=request.getParameter("jc_zcjgb_clbm");
	if (jc_zcjgb_clbm!=null)
	{
		jc_zcjgb_clbm=cf.GB2Uni(jc_zcjgb_clbm);
		if (!(jc_zcjgb_clbm.equals("")))	wheresql+=" and  (jc_zcjgb.clbm='"+jc_zcjgb_clbm+"')";
	}
	jc_zcjgb_clmc=request.getParameter("jc_zcjgb_clmc");
	if (jc_zcjgb_clmc!=null)
	{
		jc_zcjgb_clmc=cf.GB2Uni(jc_zcjgb_clmc);
		if (!(jc_zcjgb_clmc.equals("")))	wheresql+=" and  (jc_zcjgb.clmc like '%"+jc_zcjgb_clmc+"%')";
	}
	cldlbm=request.getParameter("cldlbm");
	if (cldlbm!=null)
	{
		cldlbm=cf.GB2Uni(cldlbm);
		if (!(cldlbm.equals("")))	wheresql+=" and  (jc_zcjgb.cldlbm='"+cldlbm+"')";
	}
	jc_zcjgb_gg=request.getParameter("jc_zcjgb_gg");
	if (jc_zcjgb_gg!=null)
	{
		jc_zcjgb_gg=cf.GB2Uni(jc_zcjgb_gg);
		if (!(jc_zcjgb_gg.equals("")))	wheresql+=" and  (jc_zcjgb.gg like '%"+jc_zcjgb_gg+"%')";
	}
	jc_zcjgb_lsj=request.getParameter("jc_zcjgb_lsj");
	if (jc_zcjgb_lsj!=null)
	{
		jc_zcjgb_lsj=jc_zcjgb_lsj.trim();
		if (!(jc_zcjgb_lsj.equals("")))	wheresql+=" and  (jc_zcjgb.lsj>="+jc_zcjgb_lsj+") ";
	}
	jc_zcjgb_lsj=request.getParameter("jc_zcjgb_lsj2");
	if (jc_zcjgb_lsj!=null)
	{
		jc_zcjgb_lsj=jc_zcjgb_lsj.trim();
		if (!(jc_zcjgb_lsj.equals("")))	wheresql+=" and  (jc_zcjgb.lsj<="+jc_zcjgb_lsj+") ";
	}
	jc_zcjgb_xsj=request.getParameter("jc_zcjgb_xsj");
	if (jc_zcjgb_xsj!=null)
	{
		jc_zcjgb_xsj=jc_zcjgb_xsj.trim();
		if (!(jc_zcjgb_xsj.equals("")))	wheresql+=" and  (jc_zcjgb.xsj>="+jc_zcjgb_xsj+") ";
	}
	jc_zcjgb_xsj=request.getParameter("jc_zcjgb_xsj2");
	if (jc_zcjgb_xsj!=null)
	{
		jc_zcjgb_xsj=jc_zcjgb_xsj.trim();
		if (!(jc_zcjgb_xsj.equals("")))	wheresql+=" and  (jc_zcjgb.xsj<="+jc_zcjgb_xsj+") ";
	}
	jc_zcjgb_zp=request.getParameter("jc_zcjgb_zp");
	if (jc_zcjgb_zp!=null)
	{
		jc_zcjgb_zp=cf.GB2Uni(jc_zcjgb_zp);
		if (!(jc_zcjgb_zp.equals("")))	wheresql+=" and  (jc_zcjgb.zp='"+jc_zcjgb_zp+"')";
	}
	cllbbm=request.getParameter("cllbbm");
	if (cllbbm!=null)
	{
		cllbbm=cf.GB2Uni(cllbbm);
		if (!(cllbbm.equals("")))	wheresql+=" and  (jc_zcjgb.cllbbm like '%"+cllbbm+"%')";
	}
	jc_zcjgb_clysbm=request.getParameter("jc_zcjgb_clysbm");
	if (jc_zcjgb_clysbm!=null)
	{
		jc_zcjgb_clysbm=cf.GB2Uni(jc_zcjgb_clysbm);
		if (!(jc_zcjgb_clysbm.equals("")))	wheresql+=" and  (jc_zcjgb.clysbm like '%"+jc_zcjgb_clysbm+"%')";
	}
	jc_zcjgb_jldwbm=request.getParameter("jc_zcjgb_jldwbm");
	if (jc_zcjgb_jldwbm!=null)
	{
		jc_zcjgb_jldwbm=cf.GB2Uni(jc_zcjgb_jldwbm);
		if (!(jc_zcjgb_jldwbm.equals("")))	wheresql+=" and  (jc_zcjgb.jldwbm='"+jc_zcjgb_jldwbm+"')";
	}
	jc_zcjgb_sfbhpj=request.getParameter("jc_zcjgb_sfbhpj");
	if (jc_zcjgb_sfbhpj!=null)
	{
		jc_zcjgb_sfbhpj=cf.GB2Uni(jc_zcjgb_sfbhpj);
		if (!(jc_zcjgb_sfbhpj.equals("")))	wheresql+=" and  (jc_zcjgb.sfbhpj='"+jc_zcjgb_sfbhpj+"')";
	}
	jc_zcjgb_pjts=request.getParameter("jc_zcjgb_pjts");
	if (jc_zcjgb_pjts!=null)
	{
		jc_zcjgb_pjts=jc_zcjgb_pjts.trim();
		if (!(jc_zcjgb_pjts.equals("")))	wheresql+=" and (jc_zcjgb.pjts>="+jc_zcjgb_pjts+") ";
	}
	jc_zcjgb_pjts=request.getParameter("jc_zcjgb_pjts2");
	if (jc_zcjgb_pjts!=null)
	{
		jc_zcjgb_pjts=jc_zcjgb_pjts.trim();
		if (!(jc_zcjgb_pjts.equals("")))	wheresql+=" and (jc_zcjgb.pjts<="+jc_zcjgb_pjts+") ";
	}

	String jgpx=request.getParameter("jgpx");
	String myxssl=request.getParameter("myxssl");

	ls_sql="SELECT ppmc,jc_zcjgb.clmc,DECODE(jc_zcjgb.sftjcp,'Y','��','N','��'),jc_zcjgb.xh,cllbbm,jc_zcjgb.gg,jc_zcjgb.clbm,clysbm,jldwbm,jc_zcjgb.lsj,jc_zcjgb.xsj,cxhdbl||'%',DECODE(sfycx,'N','��','Y','<font color=\"#FF0000\">�д���</font>'),cxkssj,cxjzsj,cxj,lscxhdbl||'%',DECODE(jc_zcjgb.sfbhpj,'Y','<font color=\"#FF0000\">��</font>','N','����'),jc_zcjgb.pjts,DECODE(sfyh,'Y','�л�','N','<font color=\"#FF0000\">�޻�</font>'),jc_zcjgb.cpjb,jc_zcjgb.fgsx,jc_zcjgb.cpsm,jc_zcjgb.cd,jc_zcjgb.zp,jc_zcjgb.lrr,jc_zcjgb.lrsj,jc_zcjgb.bz,ppmc,gysmc,clxlbm,cldlbm";
	ls_sql+=" FROM jc_zcjgb";
    ls_sql+=" where (1=1)";
    ls_sql+=wheresql;
	if (jgpx==null || jgpx.equals(""))
	{
		ls_sql+=" order by cldlbm,clxlbm,ppmc,clbm";
	}
	else{
		ls_sql+=" order by "+jgpx;
	}

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_zcjgbCxAllList.jsp","","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"clbm","jc_zcjgb_clmc","jdm_cldlbm_zcdlmc","jc_zcjgb_xh","jc_zcjgb_gg","jc_zcjgb_lsj","jc_zcjgb_xsj","sq_dwxx_dwmc","jc_zcjgb_zp","jc_zcjgb_bz","jc_zcjgb_ppbm","cllbbm","jc_zcjgb_clysbm","jc_zcjgb_jldwbm","jc_zcjgb_sfbhpj","jc_zcjgb_pjts","jc_zcjgb_pjjg"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"clbm"};
	pageObj.setKey(keyName);
//������ʾ�ϲ���
/*
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("cldlbm","1");//�в����������Hash��
	spanColHash.put("clxlbm","1");//�в����������Hash��
	spanColHash.put("ppmc","1");//�в����������Hash��
	spanColHash.put("ppmc","1");//�в����������Hash��
	spanColHash.put("gysmc","1");//�в����������Hash��
	spanColHash.put("cllbbm","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<META HTTP-EQUIV="pragma" CONTENT="no-cache">
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">

<style>
.LockHeadTable {behavior:url(/js/LockHeadTable.htc)}
</style>

</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��ѯ���</font></B>
</CENTER>

<div style="height:100%;width:100%;overflow:auto;">


<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(390,2,3);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">��Ʒ��</td>
	<td  width="4%">��������</td>
	<td  width="2%">�Ƿ��Ƽ���Ʒ</td>
	<td  width="4%">�ͺ�</td>
	<td  width="4%">���ϵ��</td>
	<td  width="4%">���</td>
	<td  width="2%">���ı���</td>
	<td  width="3%">��ɫ</td>
	<td  width="2%">������λ</td>
	<td  width="2%">�г����</td>
	<td  width="2%">���ۼ�</td>
	<td  width="2%">��������</td>
	<td  width="2%">�Ƿ��д���</td>
	<td  width="3%">������ʼʱ��</td>
	<td  width="3%">��������ʱ��</td>
	<td  width="2%">������</td>
	<td  width="2%">�����ڼ�������</td>
	<td  width="2%">�������</td>
	<td  width="2%">�������</td>
	<td  width="2%">�Ƿ��л�</td>
	<td  width="3%">��Ʒ����</td>
	<td  width="4%">�������</td>
	<td  width="6%">��Ʒ˵��</td>
	<td  width="2%">����</td>
	<td  width="3%">��Ƭ����</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="6%">��ע</td>
	<td  width="4%">Ʒ��</td>
	<td  width="7%">��Ӧ��</td>
	<td  width="3%">С��</td>
	<td  width="3%">����</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 
</div>

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>