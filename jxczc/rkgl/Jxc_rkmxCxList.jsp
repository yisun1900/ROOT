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


	String jxc_rkd_rklx=null;
	String jxc_rkd_rkdzt=null;
	String jxc_rkd_dqbm=null;
	String jxc_rkd_ckbh=null;
	jxc_rkd_rklx=request.getParameter("jxc_rkd_rklx");
	if (jxc_rkd_rklx!=null)
	{
		jxc_rkd_rklx=cf.GB2Uni(jxc_rkd_rklx);
		if (!(jxc_rkd_rklx.equals("")))	wheresql+=" and  (jxc_rkd.rklx='"+jxc_rkd_rklx+"')";
	}
	jxc_rkd_rkdzt=request.getParameter("jxc_rkd_rkdzt");
	if (jxc_rkd_rkdzt!=null)
	{
		jxc_rkd_rkdzt=cf.GB2Uni(jxc_rkd_rkdzt);
		if (!(jxc_rkd_rkdzt.equals("")))	wheresql+=" and  (jxc_rkd.rkdzt='"+jxc_rkd_rkdzt+"')";
	}
	jxc_rkd_dqbm=request.getParameter("jxc_rkd_dqbm");
	if (jxc_rkd_dqbm!=null)
	{
		jxc_rkd_dqbm=cf.GB2Uni(jxc_rkd_dqbm);
		if (!(jxc_rkd_dqbm.equals("")))	wheresql+=" and  (jxc_rkd.dqbm='"+jxc_rkd_dqbm+"')";
	}
	jxc_rkd_ckbh=request.getParameter("jxc_rkd_ckbh");
	if (jxc_rkd_ckbh!=null)
	{
		jxc_rkd_ckbh=cf.GB2Uni(jxc_rkd_ckbh);
		if (!(jxc_rkd_ckbh.equals("")))	wheresql+=" and  (jxc_rkd.ckbh='"+jxc_rkd_ckbh+"')";
	}


	String jxc_rkd_lydh=null;
	String jxc_rkd_gysmc=null;
	String jxc_rkd_gysmc2=null;
	String jxc_rkd_rkr=null;
	String rkrssbm=null;
	String jxc_rkd_rksj=null;


	jxc_rkd_lydh=request.getParameter("jxc_rkd_lydh");
	if (jxc_rkd_lydh!=null)
	{
		jxc_rkd_lydh=cf.GB2Uni(jxc_rkd_lydh);
		if (!(jxc_rkd_lydh.equals("")))	wheresql+=" and  (jxc_rkd.lydh='"+jxc_rkd_lydh+"')";
	}
	jxc_rkd_rkr=request.getParameter("jxc_rkd_rkr");
	if (jxc_rkd_rkr!=null)
	{
		jxc_rkd_rkr=cf.GB2Uni(jxc_rkd_rkr);
		if (!(jxc_rkd_rkr.equals("")))	wheresql+=" and  (jxc_rkd.rkr='"+jxc_rkd_rkr+"')";
	}
	rkrssbm=request.getParameter("rkrssbm");
	if (rkrssbm!=null)
	{
		rkrssbm=cf.GB2Uni(rkrssbm);
		if (!(rkrssbm.equals("")))	wheresql+=" and  (jxc_rkd.rkrssbm='"+rkrssbm+"')";
	}
	jxc_rkd_rksj=request.getParameter("jxc_rkd_rksj");
	if (jxc_rkd_rksj!=null)
	{
		jxc_rkd_rksj=jxc_rkd_rksj.trim();
		if (!(jxc_rkd_rksj.equals("")))	wheresql+="  and (jxc_rkd.rksj>=TO_DATE('"+jxc_rkd_rksj+"','YYYY/MM/DD'))";
	}
	jxc_rkd_rksj=request.getParameter("jxc_rkd_rksj2");
	if (jxc_rkd_rksj!=null)
	{
		jxc_rkd_rksj=jxc_rkd_rksj.trim();
		if (!(jxc_rkd_rksj.equals("")))	wheresql+="  and (jxc_rkd.rksj<=TO_DATE('"+jxc_rkd_rksj+"','YYYY/MM/DD'))";
	}
	jxc_rkd_gysmc=request.getParameter("jxc_rkd_gysmc");
	if (jxc_rkd_gysmc!=null)
	{
		jxc_rkd_gysmc=cf.GB2Uni(jxc_rkd_gysmc);
		if (!(jxc_rkd_gysmc.equals("")))	wheresql+=" and  (jxc_rkd.gysmc='"+jxc_rkd_gysmc+"')";
	}
	jxc_rkd_gysmc2=request.getParameter("jxc_rkd_gysmc2");
	if (jxc_rkd_gysmc2!=null)
	{
		jxc_rkd_gysmc2=cf.GB2Uni(jxc_rkd_gysmc2);
		if (!(jxc_rkd_gysmc2.equals("")))	wheresql+=" and  (jxc_rkd.gysmc like '%"+jxc_rkd_gysmc2+"%')";
	}


	String jxc_rkmx_rkph=null;
	String jxc_rkmx_rkxh=null;
	String jxc_rkmx_clbm=null;
	String jxc_clbm_clmc=null;
	String jxc_clbm_ppmc=null;
	String jxc_clbm_xh=null;
	String jxc_clbm_gg=null;
	String jxc_clbm_nbbm=null;
	String jxc_rkmx_scrq=null;
	String jxc_rkmx_scph=null;
	String jxc_rkmx_hjbh=null;
	String jxc_rkmx_hwbh=null;
	jxc_rkmx_rkph=request.getParameter("jxc_rkmx_rkph");
	if (jxc_rkmx_rkph!=null)
	{
		jxc_rkmx_rkph=cf.GB2Uni(jxc_rkmx_rkph);
		if (!(jxc_rkmx_rkph.equals("")))	wheresql+=" and  (jxc_rkmx.rkph='"+jxc_rkmx_rkph+"')";
	}
	jxc_rkmx_rkxh=request.getParameter("jxc_rkmx_rkxh");
	if (jxc_rkmx_rkxh!=null)
	{
		jxc_rkmx_rkxh=jxc_rkmx_rkxh.trim();
		if (!(jxc_rkmx_rkxh.equals("")))	wheresql+=" and (jxc_rkmx.rkxh="+jxc_rkmx_rkxh+") ";
	}
	jxc_rkmx_clbm=request.getParameter("jxc_rkmx_clbm");
	if (jxc_rkmx_clbm!=null)
	{
		jxc_rkmx_clbm=cf.GB2Uni(jxc_rkmx_clbm);
		if (!(jxc_rkmx_clbm.equals("")))	wheresql+=" and  (jxc_rkmx.clbm='"+jxc_rkmx_clbm+"')";
	}
	jxc_clbm_clmc=request.getParameter("jxc_clbm_clmc");
	if (jxc_clbm_clmc!=null)
	{
		jxc_clbm_clmc=cf.GB2Uni(jxc_clbm_clmc);
		if (!(jxc_clbm_clmc.equals("")))	wheresql+=" and  (jxc_clbm.clmc like '%"+jxc_clbm_clmc+"%')";
	}
	jxc_clbm_ppmc=request.getParameter("jxc_clbm_ppmc");
	if (jxc_clbm_ppmc!=null)
	{
		jxc_clbm_ppmc=cf.GB2Uni(jxc_clbm_ppmc);
		if (!(jxc_clbm_ppmc.equals("")))	wheresql+=" and  (jxc_clbm.ppmc like '%"+jxc_clbm_ppmc+"%')";
	}
	jxc_clbm_xh=request.getParameter("jxc_clbm_xh");
	if (jxc_clbm_xh!=null)
	{
		jxc_clbm_xh=cf.GB2Uni(jxc_clbm_xh);
		if (!(jxc_clbm_xh.equals("")))	wheresql+=" and  (jxc_clbm.xh like '%"+jxc_clbm_xh+"%')";
	}
	jxc_clbm_gg=request.getParameter("jxc_clbm_gg");
	if (jxc_clbm_gg!=null)
	{
		jxc_clbm_gg=cf.GB2Uni(jxc_clbm_gg);
		if (!(jxc_clbm_gg.equals("")))	wheresql+=" and  (jxc_clbm.gg like '%"+jxc_clbm_gg+"%')";
	}
	jxc_clbm_nbbm=request.getParameter("jxc_clbm_nbbm");
	if (jxc_clbm_nbbm!=null)
	{
		jxc_clbm_nbbm=cf.GB2Uni(jxc_clbm_nbbm);
		if (!(jxc_clbm_nbbm.equals("")))	wheresql+=" and  (jxc_clbm.nbbm='"+jxc_clbm_nbbm+"')";
	}
	jxc_rkmx_scrq=request.getParameter("jxc_rkmx_scrq");
	if (jxc_rkmx_scrq!=null)
	{
		jxc_rkmx_scrq=jxc_rkmx_scrq.trim();
		if (!(jxc_rkmx_scrq.equals("")))	wheresql+="  and (jxc_rkmx.scrq>=TO_DATE('"+jxc_rkmx_scrq+"','YYYY/MM/DD'))";
	}
	jxc_rkmx_scrq=request.getParameter("jxc_rkmx_scrq2");
	if (jxc_rkmx_scrq!=null)
	{
		jxc_rkmx_scrq=jxc_rkmx_scrq.trim();
		if (!(jxc_rkmx_scrq.equals("")))	wheresql+="  and (jxc_rkmx.scrq<=TO_DATE('"+jxc_rkmx_scrq+"','YYYY/MM/DD'))";
	}
	jxc_rkmx_scph=request.getParameter("jxc_rkmx_scph");
	if (jxc_rkmx_scph!=null)
	{
		jxc_rkmx_scph=cf.GB2Uni(jxc_rkmx_scph);
		if (!(jxc_rkmx_scph.equals("")))	wheresql+=" and  (jxc_rkmx.scph='"+jxc_rkmx_scph+"')";
	}
	jxc_rkmx_hjbh=request.getParameter("jxc_rkmx_hjbh");
	if (jxc_rkmx_hjbh!=null)
	{
		jxc_rkmx_hjbh=cf.GB2Uni(jxc_rkmx_hjbh);
		if (!(jxc_rkmx_hjbh.equals("")))	wheresql+=" and  (jxc_rkmx.hjbh='"+jxc_rkmx_hjbh+"')";
	}
	jxc_rkmx_hwbh=request.getParameter("jxc_rkmx_hwbh");
	if (jxc_rkmx_hwbh!=null)
	{
		jxc_rkmx_hwbh=cf.GB2Uni(jxc_rkmx_hwbh);
		if (!(jxc_rkmx_hwbh.equals("")))	wheresql+=" and  (jxc_rkmx.hwbh='"+jxc_rkmx_hwbh+"')";
	}
	ls_sql="SELECT jxc_rkmx.rkph,DECODE(jxc_rkd.rkdzt,'0','δ�ύ','1','�ȴ����','2','�ȴ����','3','�����','4','�ѽ���','6','�ȴ��ܲ����'),DECODE(jxc_rkd.rklx,'C','�ɹ����','T','�˻����','R','�������','S','�깺���','J','����ȯ�˻����','D','���Ķ����˻�','P','ֱ�����') rklx,jxc_ckmc.ckmc,jxc_rkd.rksj,jxc_rkd.gysmc,jxc_rkmx.clbm,jxc_clbm.clmc,jxc_clbm.ppmc,jxc_clbm.xh,jxc_clbm.gg,jxc_clbm.nbbm,jxc_rkmx.rksl,jxc_rkmx.rkj,jxc_rkmx.yfrkj,jxc_rkmx.rkje,jxc_rkmx.scrq,jxc_rkmx.scph,jxc_rkmx.ccpzkl,hjmc,hwmc,jxc_rkd.rkr,jxc_rkd.lydh,TO_CHAR(jxc_rkmx.rkxh),dm_dqbm.dqmc  ";
	ls_sql+=" FROM jxc_clbm,jxc_rkmx,jxc_rkd,jxc_ckmc,jxc_hjmc,jxc_hwmc,dm_dqbm  ";
    ls_sql+=" where jxc_rkmx.clbm=jxc_clbm.clbm(+)";
    ls_sql+=" and jxc_rkmx.rkph=jxc_rkd.rkph(+)";
    ls_sql+=" and jxc_rkmx.hjbh=jxc_hjmc.hjbh(+)";
    ls_sql+=" and jxc_rkmx.hwbh=jxc_hwmc.hwbh(+)";
    ls_sql+=" and jxc_rkd.ckbh=jxc_ckmc.ckbh and jxc_rkd.dqbm=dm_dqbm.dqbm ";
    ls_sql+=" and jxc_rkd.rkcllx='0'";//0�����ģ�1������
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_rkmx.rkph,jxc_clbm.clmc,jxc_rkmx.clbm";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_rkmxCxList.jsp","","","");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"rkph","rkxh","jxc_rkmx_clbm","jxc_clbm_clmc","jxc_clbm_ppmc","jxc_clbm_xh","jxc_clbm_gg","jxc_clbm_nbbm","jxc_rkmx_rksl","jxc_rkmx_rkj","jxc_rkmx_rkje","jxc_rkmx_zcpsl","jxc_rkmx_ccpsl","jxc_rkmx_thpsl","jxc_rkmx_wldssl","jxc_rkmx_bfpsl","jxc_rkmx_scrq","jxc_rkmx_scph","jxc_rkmx_ccpzkl","jxc_rkmx_hjbh","jxc_rkmx_hwbh"};
	pageObj.setDisColName(disColName);
*/



//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"rkph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/jxczc/rkgl/ViewJxc_rkd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("rkph",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�����ϸ����ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(350);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">�������</td>
	<td  width="2%">��ⵥ״̬</td>
	<td  width="3%">�������</td>
	<td  width="4%">���ֿ�</td>
	<td  width="3%">���ʱ��</td>
	<td  width="7%">������λ</td>
	<td  width="3%">���ϱ���</td>
	<td  width="6%">��������</td>
	<td  width="5%">Ʒ��</td>
	<td  width="5%">�ͺ�</td>
	<td  width="4%">���</td>
	<td  width="4%">�ڲ�����</td>
	<td  width="3%">�������</td>
	<td  width="3%">����</td>
	<td  width="3%">���˷�����</td>
	<td  width="4%">�����</td>
	<td  width="3%">��������</td>
	<td  width="4%">��������</td>
	<td  width="2%">�д�Ʒ�ۿ���</td>
	<td  width="4%">������</td>
	<td  width="4%">����λ</td>
	<td  width="2%">�����</td>
	<td  width="3%">��Դ����</td>
	<td  width="2%">������</td>
	<td  width="2%">����</td>
</tr>
<%
//	pageObj.printDateSum();
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