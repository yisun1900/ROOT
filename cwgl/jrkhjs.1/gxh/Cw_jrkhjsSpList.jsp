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
	String qyrq=null;
	qyrq=request.getParameter("qyrq");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq>=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}
	qyrq=request.getParameter("qyrq2");
	if (qyrq!=null)
	{
		qyrq=qyrq.trim();
		if (!(qyrq.equals("")))	wheresql+="  and (crm_khxx.qyrq<=TO_DATE('"+qyrq+"','YYYY-MM-DD'))";
	}


	
	String cw_jrkhjs_spr=null;
	String cw_jrkhjs_spsj=null;
	String cw_jrkhjs_lx=null;
	String cw_jrkhjs_clzt=null;
	String cw_jrkhjs_lrr=null;
	String cw_jrkhjs_lrsj=null;



	cw_jrkhjs_spr=request.getParameter("cw_jrkhjs_spr");
	if (cw_jrkhjs_spr!=null)
	{
		cw_jrkhjs_spr=cf.GB2Uni(cw_jrkhjs_spr);
		if (!(cw_jrkhjs_spr.equals("")))	wheresql+=" and  (cw_jrkhjs.spr='"+cw_jrkhjs_spr+"')";
	}
	cw_jrkhjs_spsj=request.getParameter("cw_jrkhjs_spsj");
	if (cw_jrkhjs_spsj!=null)
	{
		cw_jrkhjs_spsj=cw_jrkhjs_spsj.trim();
		if (!(cw_jrkhjs_spsj.equals("")))	wheresql+="  and (cw_jrkhjs.spsj=TO_DATE('"+cw_jrkhjs_spsj+"','YYYY/MM/DD'))";
	}
	cw_jrkhjs_lx=request.getParameter("cw_jrkhjs_lx");
	if (cw_jrkhjs_lx!=null)
	{
		cw_jrkhjs_lx=cf.GB2Uni(cw_jrkhjs_lx);
		if (!(cw_jrkhjs_lx.equals("")))	wheresql+=" and  (cw_jrkhjs.lx='"+cw_jrkhjs_lx+"')";
	}
	cw_jrkhjs_clzt=request.getParameter("cw_jrkhjs_clzt");
	if (cw_jrkhjs_clzt!=null)
	{
		cw_jrkhjs_clzt=cf.GB2Uni(cw_jrkhjs_clzt);
		if (!(cw_jrkhjs_clzt.equals("")))	wheresql+=" and  (cw_jrkhjs.clzt='"+cw_jrkhjs_clzt+"')";
	}
	cw_jrkhjs_lrr=request.getParameter("cw_jrkhjs_lrr");
	if (cw_jrkhjs_lrr!=null)
	{
		cw_jrkhjs_lrr=cf.GB2Uni(cw_jrkhjs_lrr);
		if (!(cw_jrkhjs_lrr.equals("")))	wheresql+=" and  (cw_jrkhjs.lrr='"+cw_jrkhjs_lrr+"')";
	}
	cw_jrkhjs_lrsj=request.getParameter("cw_jrkhjs_lrsj");
	if (cw_jrkhjs_lrsj!=null)
	{
		cw_jrkhjs_lrsj=cw_jrkhjs_lrsj.trim();
		if (!(cw_jrkhjs_lrsj.equals("")))	wheresql+="  and (cw_jrkhjs.lrsj=TO_DATE('"+cw_jrkhjs_lrsj+"','YYYY/MM/DD'))";
	}


	ls_sql="SELECT DECODE(cw_jrkhjs.lx,'1','���Ի�','2','�ײ�') lx, DECODE(cw_jrkhjs.clzt,'1','δ����','2','����ͬ��','3','������ͬ��'),cw_jrkhjs.khbh,crm_khxx.khxm,crm_khxx.fwdz,cw_jrkhjs.htsjf,cw_jrkhjs.sssjf,cw_jrkhjs.wdzgce,cw_jrkhjs.qye,cw_jrkhjs.zqljzjx,cw_jrkhjs.zhljzjx,cw_jrkhjs.zqhj,cw_jrkhjs.zhhj,cw_jrkhjs.jsze,cw_jrkhjs.yjzxk,cw_jrkhjs.dj,cw_jrkhjs.yjwk,cw_jrkhjs.yhje,cw_jrkhjs.fqbl,cw_jrkhjs.fqje,cw_jrkhjs.djfxje,cw_jrkhjs.dyq,cw_jrkhjs.yhze,cw_jrkhjs.shfqje,cw_jrkhjs.yjzck,cw_jrkhjs.zcddjezq,cw_jrkhjs.zcddyh,cw_jrkhjs.dgzcjezq,cw_jrkhjs.dgzcyh,cw_jrkhjs.zcjsje,cw_jrkhjs.pck,cw_jrkhjs.khbjk,cw_jrkhjs.lrr,cw_jrkhjs.lrsj,dwmc,cw_jrkhjs.bz  ";
	ls_sql+=" FROM crm_khxx,cw_jrkhjs,sq_dwxx  ";
    ls_sql+=" where cw_jrkhjs.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_jrkhjs.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_jrkhjs.lx='1'";
    ls_sql+=" and cw_jrkhjs.clzt='1'";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_jrkhjs.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_jrkhjsSpList.jsp","","","ShCw_jrkhjs.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("���");
//���ð�ť����
	String[] buttonName={"����ͬ��"};//��ť����ʾ����
	String[] buttonLink={"SavePlCw_jrkhjs.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/cwgl/jrkhjs/ViewGxhCw_jrkhjs.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("lx",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
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
  <B><font size="3">���㣭���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(480);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">����</td>
	<td  width="2%">����״̬</td>
	<td  width="2%">�ͻ����</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="5%">���ݵ�ַ</td>
	<td  width="2%">��ͬ��Ʒ�</td>
	<td  width="2%">ʵ����Ʒ�</td>
	<td  width="3%">ǩԼ�ܶ��ǰ</td>
	<td  width="3%">ǩԼ�ܶ�ۺ�</td>
	<td  width="2%">�������ܶ��ǰ</td>
	<td  width="2%">�������ܶ�ۺ�</td>
	<td  width="3%">���̺ϼƣ���ǰ</td>
	<td  width="3%">���̺ϼƣ��ۺ�</td>
	<td  width="3%">����ʩ���ܶ�</td>
	<td  width="3%">�ѽ�װ�޿�</td>
	<td  width="2%">����תװ�޿�</td>
	<td  width="2%">Ӧ��β��</td>
	<td  width="3%">�ۿ��Ż�</td>
	<td  width="2%">��ȯ����</td>
	<td  width="2%">��ȯ�Ż�</td>
	<td  width="2%">���������Ż�</td>
	<td  width="2%">����ȯ</td>
	<td  width="3%">�Ż��ܶ�</td>
	<td  width="2%">�ջط�ȯ���</td>
	<td  width="2%">�ѽ����Ŀ�</td>
	<td  width="2%">�������</td>
	<td  width="2%">��������Ż�</td>
	<td  width="2%">��������</td>
	<td  width="2%">���������Ż�</td>
	<td  width="2%">���Ľ����</td>
	<td  width="2%">�⳥�����ڷ�</td>
	<td  width="3%">�ͻ�������</td>
	<td  width="2%">¼����</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="32%">��ע</td>
</tr>
<%
	pageObj.displayDateSum();
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