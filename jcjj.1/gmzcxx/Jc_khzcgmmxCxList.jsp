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

	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}
	
	
	
	
	
	
	
	
	
	String ppgys=null;
	String zcdlbm=null;
	String zcxlbm=null;
	String jc_khzcgmmx_yj=null;
	String jc_khzcgmmx_zhj=null;
	String jc_khzcgmmx_dj=null;
	String jc_khzcgmmx_ssk=null;
	String jc_khzcgmmx_rq=null;
	String crm_khxx_khxm=null;
	String crm_khxx_fwdz=null;

	ppgys=request.getParameter("ppgys");
	if (ppgys!=null)
	{
		ppgys=cf.GB2Uni(ppgys);
		if (!(ppgys.equals("")))	wheresql+=" and  (jc_khzcgmmx.ppgys='"+ppgys+"')";
	}
	zcdlbm=request.getParameter("zcdlbm");
	if (zcdlbm!=null)
	{
		zcdlbm=cf.GB2Uni(zcdlbm);
		if (!(zcdlbm.equals("")))	wheresql+=" and  (jc_khzcgmmx.zcdlbm='"+zcdlbm+"')";
	}
	zcxlbm=request.getParameter("zcxlbm");
	if (zcxlbm!=null)
	{
		zcxlbm=cf.GB2Uni(zcxlbm);
		if (!(zcxlbm.equals("")))	wheresql+=" and  (jc_khzcgmmx.zcxlbm='"+zcxlbm+"')";
	}
	jc_khzcgmmx_yj=request.getParameter("jc_khzcgmmx_yj");
	if (jc_khzcgmmx_yj!=null)
	{
		jc_khzcgmmx_yj=jc_khzcgmmx_yj.trim();
		if (!(jc_khzcgmmx_yj.equals("")))	wheresql+=" and  (jc_khzcgmmx.yj="+jc_khzcgmmx_yj+") ";
	}
	jc_khzcgmmx_zhj=request.getParameter("jc_khzcgmmx_zhj");
	if (jc_khzcgmmx_zhj!=null)
	{
		jc_khzcgmmx_zhj=jc_khzcgmmx_zhj.trim();
		if (!(jc_khzcgmmx_zhj.equals("")))	wheresql+=" and  (jc_khzcgmmx.zhj="+jc_khzcgmmx_zhj+") ";
	}
	jc_khzcgmmx_dj=request.getParameter("jc_khzcgmmx_dj");
	if (jc_khzcgmmx_dj!=null)
	{
		jc_khzcgmmx_dj=jc_khzcgmmx_dj.trim();
		if (!(jc_khzcgmmx_dj.equals("")))	wheresql+=" and  (jc_khzcgmmx.dj="+jc_khzcgmmx_dj+") ";
	}
	jc_khzcgmmx_ssk=request.getParameter("jc_khzcgmmx_ssk");
	if (jc_khzcgmmx_ssk!=null)
	{
		jc_khzcgmmx_ssk=jc_khzcgmmx_ssk.trim();
		if (!(jc_khzcgmmx_ssk.equals("")))	wheresql+=" and  (jc_khzcgmmx.ssk="+jc_khzcgmmx_ssk+") ";
	}
	jc_khzcgmmx_rq=request.getParameter("jc_khzcgmmx_rq");
	if (jc_khzcgmmx_rq!=null)
	{
		jc_khzcgmmx_rq=jc_khzcgmmx_rq.trim();
		if (!(jc_khzcgmmx_rq.equals("")))	wheresql+="  and (jc_khzcgmmx.rq>=TO_DATE('"+jc_khzcgmmx_rq+"','YYYY/MM/DD'))";
	}
	jc_khzcgmmx_rq=request.getParameter("jc_khzcgmmx_rq2");
	if (jc_khzcgmmx_rq!=null)
	{
		jc_khzcgmmx_rq=jc_khzcgmmx_rq.trim();
		if (!(jc_khzcgmmx_rq.equals("")))	wheresql+="  and (jc_khzcgmmx.rq<=TO_DATE('"+jc_khzcgmmx_rq+"','YYYY/MM/DD'))";
	}
	crm_khxx_khxm=request.getParameter("crm_khxx_khxm");
	if (crm_khxx_khxm!=null)
	{
		crm_khxx_khxm=cf.GB2Uni(crm_khxx_khxm);
		if (!(crm_khxx_khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+crm_khxx_khxm+"')";
	}
	crm_khxx_fwdz=request.getParameter("crm_khxx_fwdz");
	if (crm_khxx_fwdz!=null)
	{
		crm_khxx_fwdz=cf.GB2Uni(crm_khxx_fwdz);
		if (!(crm_khxx_fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+crm_khxx_fwdz+"')";
	}

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String jgpx4=cf.GB2Uni(request.getParameter("jgpx4"));
	String jgpx5=cf.GB2Uni(request.getParameter("jgpx5"));
	String jgpx6=cf.GB2Uni(request.getParameter("jgpx6"));
	String ordersql=" order by "+jgpx1;
	if (!jgpx2.equals(""))
	{
		ordersql+=","+jgpx2;
	}
	if (!jgpx3.equals(""))
	{
		ordersql+=","+jgpx3;
	}
	if (!jgpx4.equals(""))
	{
		ordersql+=","+jgpx4;
	}
	if (!jgpx5.equals(""))
	{
		ordersql+=","+jgpx5;
	}
	if (!jgpx6.equals(""))
	{
		ordersql+=","+jgpx6;
	}

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=request.getParameter("myxssl");

	ls_sql="SELECT crm_khxx.khxm,crm_khxx.fwdz,jc_khzcgmmx.zcdlbm,jc_khzcgmmx.zcxlbm,jc_khzcgmmx.ppgys,TO_CHAR(jc_khzcgmmx.yj) yj,TO_CHAR(jc_khzcgmmx.zhj) zhj,jc_khzcgmmx.dj,jc_khzcgmmx.ssk,jc_khzcgmmx.rq,jc_khzcgmmx.bz,jc_khzcgmmx.khbh  ";
	ls_sql+=" FROM jc_khzcgmmx,crm_khxx  ";
    ls_sql+=" where jc_khzcgmmx.khbh=crm_khxx.khbh(+)";
    ls_sql+=wheresql;
    ls_sql+=ordersql;
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jc_khzcgmmxCxList.jsp","SelectCxJc_khzcgmmx.jsp","","");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//������ʾ��
	String[] disColName={"khbh","ppgys","zcdlbm","zcxlbm","jc_khzcgmmx_yj","jc_khzcgmmx_zhj","jc_khzcgmmx_dj","jc_khzcgmmx_ssk","jc_khzcgmmx_rq","jc_khzcgmmx_bz","crm_khxx_khxm","crm_khxx_fwdz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"khbh","ppgys"};
	pageObj.setKey(keyName);
/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"saleid","corpid"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="link.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("saleid",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
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
  <B><font size="3">���Ĺ�����ϸ����ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(170);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">�ͻ�����</td>
	<td  width="14%">���ݵ�ַ</td>
	<td  width="9%">���Ĵ���</td>
	<td  width="9%">����С��</td>
	<td  width="11%">Ʒ�ƹ�Ӧ������</td>
	<td  width="6%">ԭ��</td>
	<td  width="6%">�ۺ��</td>
	<td  width="8%">����</td>
	<td  width="8%">ʵ�տ�</td>
	<td  width="6%">����</td>
	<td  width="14%">��ע</td>
	<td  width="4%">�ͻ����</td>
</tr>
<%
	pageObj.printDateSum();
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