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
	String xgjlh=null;
	String khbh=null;
	String xgqfgsbh=null;
	String xgqdwbh=null;
	String xgqsjsbh=null;
	String xgqsjs=null;
	String xgqsjsgh=null;
	String xgqwdzgce=null;
	String xgqqye=null;
	String xgqsuijin=null;
	String xgqsuijinbfb=null;
	String xgqsjf=null;
	String xgqglf=null;
	String xgqzkl=null;
	String xgqcxhd=null;
	String xgqcxhd2=null;
	String xghfgsbh=null;
	String xghdwbh=null;
	String xghsjsbh=null;
	String xghsjs=null;
	String xghsjsgh=null;
	String xghwdzgce=null;
	String xghqye=null;
	String xghsuijin=null;
	String xghsuijinbfb=null;
	String xghsjf=null;
	String xghglf=null;
	String xghzkl=null;
	String xghcxhd=null;
	String xghcxhd2=null;
	String lrr=null;
	String lrsj=null;
	String lrbm=null;
	String scbz=null;
	String scr=null;
	String scsj=null;

	
	String khxm=null;
	String fwdz=null;
	String hth=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and   (crm_khxx.khxm like '%"+khxm+"%')";
	}
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz+"%')";
	}
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		hth=cf.GB2Uni(hth);
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	
	xgjlh=request.getParameter("xgjlh");
	if (xgjlh!=null)
	{
		xgjlh=cf.GB2Uni(xgjlh);
		if (!(xgjlh.equals("")))	wheresql+=" and  (crm_qyexgjl.xgjlh='"+xgjlh+"')";
	}
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		khbh=cf.GB2Uni(khbh);
		if (!(khbh.equals("")))	wheresql+=" and  (crm_qyexgjl.khbh='"+khbh+"')";
	}
	xgqfgsbh=request.getParameter("xgqfgsbh");
	if (xgqfgsbh!=null)
	{
		xgqfgsbh=cf.GB2Uni(xgqfgsbh);
		if (!(xgqfgsbh.equals("")))	wheresql+=" and  (xgqfgsbh='"+xgqfgsbh+"')";
	}
	xgqdwbh=request.getParameter("xgqdwbh");
	if (xgqdwbh!=null)
	{
		xgqdwbh=cf.GB2Uni(xgqdwbh);
		if (!(xgqdwbh.equals("")))	wheresql+=" and  (xgqdwbh='"+xgqdwbh+"')";
	}
	xgqsjsbh=request.getParameter("xgqsjsbh");
	if (xgqsjsbh!=null)
	{
		xgqsjsbh=cf.GB2Uni(xgqsjsbh);
		if (!(xgqsjsbh.equals("")))	wheresql+=" and  (xgqsjsbh='"+xgqsjsbh+"')";
	}
	xgqsjs=request.getParameter("xgqsjs");
	if (xgqsjs!=null)
	{
		xgqsjs=cf.GB2Uni(xgqsjs);
		if (!(xgqsjs.equals("")))	wheresql+=" and  (xgqsjs='"+xgqsjs+"')";
	}
	xgqsjsgh=request.getParameter("xgqsjsgh");
	if (xgqsjsgh!=null)
	{
		xgqsjsgh=cf.GB2Uni(xgqsjsgh);
		if (!(xgqsjsgh.equals("")))	wheresql+=" and  (xgqsjsgh='"+xgqsjsgh+"')";
	}
	xgqwdzgce=request.getParameter("xgqwdzgce");
	if (xgqwdzgce!=null)
	{
		xgqwdzgce=xgqwdzgce.trim();
		if (!(xgqwdzgce.equals("")))	wheresql+=" and  (xgqwdzgce="+xgqwdzgce+") ";
	}
	xgqqye=request.getParameter("xgqqye");
	if (xgqqye!=null)
	{
		xgqqye=xgqqye.trim();
		if (!(xgqqye.equals("")))	wheresql+=" and  (xgqqye="+xgqqye+") ";
	}
	xgqsuijin=request.getParameter("xgqsuijin");
	if (xgqsuijin!=null)
	{
		xgqsuijin=xgqsuijin.trim();
		if (!(xgqsuijin.equals("")))	wheresql+=" and  (xgqsuijin="+xgqsuijin+") ";
	}
	xgqsuijinbfb=request.getParameter("xgqsuijinbfb");
	if (xgqsuijinbfb!=null)
	{
		xgqsuijinbfb=xgqsuijinbfb.trim();
		if (!(xgqsuijinbfb.equals("")))	wheresql+=" and  (xgqsuijinbfb="+xgqsuijinbfb+") ";
	}
	xgqsjf=request.getParameter("xgqsjf");
	if (xgqsjf!=null)
	{
		xgqsjf=xgqsjf.trim();
		if (!(xgqsjf.equals("")))	wheresql+=" and  (xgqsjf="+xgqsjf+") ";
	}
	xgqglf=request.getParameter("xgqglf");
	if (xgqglf!=null)
	{
		xgqglf=xgqglf.trim();
		if (!(xgqglf.equals("")))	wheresql+=" and  (xgqglf="+xgqglf+") ";
	}
	xgqzkl=request.getParameter("xgqzkl");
	if (xgqzkl!=null)
	{
		xgqzkl=xgqzkl.trim();
		if (!(xgqzkl.equals("")))	wheresql+=" and  (xgqzkl="+xgqzkl+") ";
	}
	xgqcxhd=request.getParameter("xgqcxhd");
	if (xgqcxhd!=null)
	{
		xgqcxhd=cf.GB2Uni(xgqcxhd);
		if (!(xgqcxhd.equals("")))	wheresql+=" and  (xgqcxhd='"+xgqcxhd+"')";
	}
	xgqcxhd2=request.getParameter("xgqcxhd2");
	if (xgqcxhd2!=null)
	{
		xgqcxhd2=cf.GB2Uni(xgqcxhd2);
		if (!(xgqcxhd2.equals("")))	wheresql+=" and  (xgqcxhd='"+xgqcxhd2+"')";
	}
	xghfgsbh=request.getParameter("xghfgsbh");
	if (xghfgsbh!=null)
	{
		xghfgsbh=cf.GB2Uni(xghfgsbh);
		if (!(xghfgsbh.equals("")))	wheresql+=" and  (xghfgsbh='"+xghfgsbh+"')";
	}
	xghdwbh=request.getParameter("xghdwbh");
	if (xghdwbh!=null)
	{
		xghdwbh=cf.GB2Uni(xghdwbh);
		if (!(xghdwbh.equals("")))	wheresql+=" and  (xghdwbh='"+xghdwbh+"')";
	}
	xghsjsbh=request.getParameter("xghsjsbh");
	if (xghsjsbh!=null)
	{
		xghsjsbh=cf.GB2Uni(xghsjsbh);
		if (!(xghsjsbh.equals("")))	wheresql+=" and  (xghsjsbh='"+xghsjsbh+"')";
	}
	xghsjs=request.getParameter("xghsjs");
	if (xghsjs!=null)
	{
		xghsjs=cf.GB2Uni(xghsjs);
		if (!(xghsjs.equals("")))	wheresql+=" and  (xghsjs='"+xghsjs+"')";
	}
	xghsjsgh=request.getParameter("xghsjsgh");
	if (xghsjsgh!=null)
	{
		xghsjsgh=cf.GB2Uni(xghsjsgh);
		if (!(xghsjsgh.equals("")))	wheresql+=" and  (xghsjsgh='"+xghsjsgh+"')";
	}
	xghwdzgce=request.getParameter("xghwdzgce");
	if (xghwdzgce!=null)
	{
		xghwdzgce=xghwdzgce.trim();
		if (!(xghwdzgce.equals("")))	wheresql+=" and  (xghwdzgce="+xghwdzgce+") ";
	}
	xghqye=request.getParameter("xghqye");
	if (xghqye!=null)
	{
		xghqye=xghqye.trim();
		if (!(xghqye.equals("")))	wheresql+=" and  (xghqye="+xghqye+") ";
	}
	xghsuijin=request.getParameter("xghsuijin");
	if (xghsuijin!=null)
	{
		xghsuijin=xghsuijin.trim();
		if (!(xghsuijin.equals("")))	wheresql+=" and  (xghsuijin="+xghsuijin+") ";
	}
	xghsuijinbfb=request.getParameter("xghsuijinbfb");
	if (xghsuijinbfb!=null)
	{
		xghsuijinbfb=xghsuijinbfb.trim();
		if (!(xghsuijinbfb.equals("")))	wheresql+=" and  (xghsuijinbfb="+xghsuijinbfb+") ";
	}
	xghsjf=request.getParameter("xghsjf");
	if (xghsjf!=null)
	{
		xghsjf=xghsjf.trim();
		if (!(xghsjf.equals("")))	wheresql+=" and  (xghsjf="+xghsjf+") ";
	}
	xghglf=request.getParameter("xghglf");
	if (xghglf!=null)
	{
		xghglf=xghglf.trim();
		if (!(xghglf.equals("")))	wheresql+=" and  (xghglf="+xghglf+") ";
	}
	xghzkl=request.getParameter("xghzkl");
	if (xghzkl!=null)
	{
		xghzkl=xghzkl.trim();
		if (!(xghzkl.equals("")))	wheresql+=" and  (xghzkl="+xghzkl+") ";
	}
	xghcxhd=request.getParameter("xghcxhd");
	if (xghcxhd!=null)
	{
		xghcxhd=cf.GB2Uni(xghcxhd);
		if (!(xghcxhd.equals("")))	wheresql+=" and  (xghcxhd='"+xghcxhd+"')";
	}
	xghcxhd2=request.getParameter("xghcxhd2");
	if (xghcxhd2!=null)
	{
		xghcxhd2=cf.GB2Uni(xghcxhd2);
		if (!(xghcxhd2.equals("")))	wheresql+=" and  (xghcxhd='"+xghcxhd2+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (crm_qyexgjl.lrr='"+lrr+"')";
	}
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_qyexgjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_qyexgjl.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrbm=request.getParameter("lrbm");
	if (lrbm!=null)
	{
		lrbm=cf.GB2Uni(lrbm);
		if (!(lrbm.equals("")))	wheresql+=" and  (crm_qyexgjl.lrbm='"+lrbm+"')";
	}
	scbz=request.getParameter("scbz");
	if (scbz!=null)
	{
		scbz=cf.GB2Uni(scbz);
		if (!(scbz.equals("")))	wheresql+=" and  (crm_qyexgjl.scbz='"+scbz+"')";
	}
	scr=request.getParameter("scr");
	if (scr!=null)
	{
		scr=cf.GB2Uni(scr);
		if (!(scr.equals("")))	wheresql+=" and  (crm_qyexgjl.scr='"+scr+"')";
	}
	scsj=request.getParameter("scsj");
	if (scsj!=null)
	{
		scsj=scsj.trim();
		if (!(scsj.equals("")))	wheresql+="  and (crm_qyexgjl.scsj>=TO_DATE('"+scsj+"','YYYY/MM/DD'))";
	}
	scsj=request.getParameter("scsj2");
	if (scsj!=null)
	{
		scsj=scsj.trim();
		if (!(scsj.equals("")))	wheresql+="  and (crm_qyexgjl.scsj<=TO_DATE('"+scsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT crm_qyexgjl.xgjlh,crm_qyexgjl.khbh,crm_khxx.khxm,crm_khxx.fwdz,crm_khxx.hth,a.dwmc xgqfgsbh,b.dwmc xgqdwbh,xgqsjsbh,xgqsjs,xgqsjsgh,xgqwdzgce,xgqqye,xgqsuijin,xgqsuijinbfb,xgqsjf,xgqglf,xgqzkl,xgqcxhd,xgqcxhdbmxq,xgqcxhdbmzh,c.dwmc xghfgsbh,d.dwmc xghdwbh,xghsjsbh,xghsjs,xghsjsgh,xghwdzgce,xghqye,xghsuijin,xghsuijinbfb,xghsjf,xghglf,xghzkl,xghcxhd,xghcxhdbmxq,xghcxhdbmzh,crm_qyexgjl.lrr,crm_qyexgjl.lrsj, DECODE(crm_qyexgjl.scbz,'N','δɾ��','Y','ɾ��'),crm_qyexgjl.scr,crm_qyexgjl.scsj,crm_qyexgjl.bz  ";
	ls_sql+=" FROM crm_qyexgjl,crm_khxx,sq_dwxx a,sq_dwxx b,sq_dwxx c,sq_dwxx d  ";
    ls_sql+=" where crm_qyexgjl.khbh=crm_khxx.khbh";
    ls_sql+=" and crm_qyexgjl.xgqfgsbh=a.dwbh(+) and crm_qyexgjl.xgqdwbh=b.dwbh(+)";
    ls_sql+=" and crm_qyexgjl.xghfgsbh=c.dwbh(+) and crm_qyexgjl.xghdwbh=d.dwbh(+)";
    ls_sql+=wheresql;
    ls_sql+=" order by crm_qyexgjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_qyexgjlList.jsp","SelectCrm_qyexgjl.jsp","","EditCrm_qyexgjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"xgjlh","khbh","xgqfgsbh","xgqdwbh","xgqsjsbh","xgqsjs","xgqsjsgh","xgqwdzgce","xgqqye","xgqsuijin","xgqsuijinbfb","xgqsjf","xgqglf","xgqzkl","xgqcxhd","xghfgsbh","xghdwbh","xghsjsbh","xghsjs","xghsjsgh","xghwdzgce","xghqye","xghsuijin","xghsuijinbfb","xghsjf","xghglf","xghzkl","xghcxhd","lrr","lrsj","lrbm","scbz","scr","scsj","bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"xgjlh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteCrm_qyexgjl.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(500);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">�޸ļ�¼��</td>
	<td  width="2%">�ͻ����</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="6%">���ݵ�ַ</td>
	<td  width="2%">��ͬ��</td>
	<td  width="3%">�޸�ǰ�ֹ�˾</td>
	<td  width="3%">�޸�ǰǩԼ����</td>
	<td  width="2%">�޸�ǰ�����</td>
	<td  width="2%">�޸�ǰ���ʦ</td>
	<td  width="2%">�޸�ǰ���ʦ����</td>
	<td  width="3%">�޸�ǰ����ԭ����</td>
	<td  width="3%">�޸�ǰǩԼ��</td>
	<td  width="2%">�޸�ǰ˰��</td>
	<td  width="2%">�޸�ǰ˰��ٷֱ�</td>
	<td  width="3%">�޸�ǰ��Ʒ�</td>
	<td  width="2%">�޸�ǰ�����</td>
	<td  width="2%">�޸�ǰ�ۿ���</td>
	<td  width="3%">�޸�ǰ��˾�����</td>
	<td  width="2%">�޸�ǰС�������</td>
	<td  width="2%">�޸�ǰչ������</td>
	<td  width="2%">�޸ĺ�ֹ�˾</td>
	<td  width="2%">�޸ĺ�ǩԼ����</td>
	<td  width="2%">�޸ĺ������</td>
	<td  width="2%">�޸ĺ����ʦ</td>
	<td  width="2%">�޸ĺ����ʦ����</td>
	<td  width="3%">�޸ĺ󹤳�ԭ����</td>
	<td  width="3%">�޸ĺ�ǩԼ��</td>
	<td  width="2%">�޸ĺ�˰��</td>
	<td  width="2%">�޸ĺ�˰��ٷֱ�</td>
	<td  width="3%">�޸ĺ���Ʒ�</td>
	<td  width="2%">�޸ĺ�����</td>
	<td  width="2%">�޸ĺ��ۿ���</td>
	<td  width="3%">�޸ĺ�����</td>
	<td  width="2%">�޸ĺ�С�������</td>
	<td  width="2%">�޸ĺ�չ������</td>
	<td  width="2%">¼����</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="2%">ɾ����־</td>
	<td  width="2%">ɾ����</td>
	<td  width="2%">ɾ��ʱ��</td>
	<td  width="4%">��ע</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
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