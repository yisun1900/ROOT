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


	
	String cw_khjsty_spr=null;
	String cw_khjsty_spsj=null;
	String cw_khjsty_lx=null;
	String cw_khjsty_clzt=null;
	String cw_khjsty_lrr=null;
	String cw_khjsty_lrsj=null;



	cw_khjsty_spr=request.getParameter("cw_khjsty_spr");
	if (cw_khjsty_spr!=null)
	{
		cw_khjsty_spr=cf.GB2Uni(cw_khjsty_spr);
		if (!(cw_khjsty_spr.equals("")))	wheresql+=" and  (cw_khjsty.spr='"+cw_khjsty_spr+"')";
	}
	cw_khjsty_spsj=request.getParameter("cw_khjsty_spsj");
	if (cw_khjsty_spsj!=null)
	{
		cw_khjsty_spsj=cw_khjsty_spsj.trim();
		if (!(cw_khjsty_spsj.equals("")))	wheresql+="  and (cw_khjsty.spsj>=TO_DATE('"+cw_khjsty_spsj+"','YYYY-MM-DD'))";
	}
	cw_khjsty_spsj=request.getParameter("cw_khjsty_spsj2");
	if (cw_khjsty_spsj!=null)
	{
		cw_khjsty_spsj=cw_khjsty_spsj.trim();
		if (!(cw_khjsty_spsj.equals("")))	wheresql+="  and (cw_khjsty.spsj<=TO_DATE('"+cw_khjsty_spsj+"','YYYY-MM-DD'))";
	}
	cw_khjsty_lx=request.getParameter("cw_khjsty_lx");
	if (cw_khjsty_lx!=null)
	{
		cw_khjsty_lx=cf.GB2Uni(cw_khjsty_lx);
		if (!(cw_khjsty_lx.equals("")))	wheresql+=" and  (cw_khjsty.lx='"+cw_khjsty_lx+"')";
	}
	cw_khjsty_clzt=request.getParameter("cw_khjsty_clzt");
	if (cw_khjsty_clzt!=null)
	{
		cw_khjsty_clzt=cf.GB2Uni(cw_khjsty_clzt);
		if (!(cw_khjsty_clzt.equals("")))	wheresql+=" and  (cw_khjsty.clzt='"+cw_khjsty_clzt+"')";
	}
	cw_khjsty_lrr=request.getParameter("cw_khjsty_lrr");
	if (cw_khjsty_lrr!=null)
	{
		cw_khjsty_lrr=cf.GB2Uni(cw_khjsty_lrr);
		if (!(cw_khjsty_lrr.equals("")))	wheresql+=" and  (cw_khjsty.lrr='"+cw_khjsty_lrr+"')";
	}
	cw_khjsty_lrsj=request.getParameter("cw_khjsty_lrsj");
	if (cw_khjsty_lrsj!=null)
	{
		cw_khjsty_lrsj=cw_khjsty_lrsj.trim();
		if (!(cw_khjsty_lrsj.equals("")))	wheresql+="  and (cw_khjsty.lrsj>=TO_DATE('"+cw_khjsty_lrsj+"','YYYY-MM-DD'))";
	}
	cw_khjsty_lrsj=request.getParameter("cw_khjsty_lrsj2");
	if (cw_khjsty_lrsj!=null)
	{
		cw_khjsty_lrsj=cw_khjsty_lrsj.trim();
		if (!(cw_khjsty_lrsj.equals("")))	wheresql+="  and (cw_khjsty.lrsj<=TO_DATE('"+cw_khjsty_lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}


	ls_sql="SELECT DECODE(cw_khjsty.lx,'1','���Ի�','2','�ײ�') lx, DECODE(cw_khjsty.clzt,'1','δ����','2','����ͬ��','3','������ͬ��'),cw_khjsty.khbh,crm_khxx.khxm,crm_khxx.fwdz,cw_khjsty.htsjf,cw_khjsty.sssjf,cw_khjsty.wdzgce,cw_khjsty.qye,cw_khjsty.zqljzjx,cw_khjsty.zhljzjx,cw_khjsty.zqhj,cw_khjsty.zhhj,cw_khjsty.jsze,cw_khjsty.yjzxk,cw_khjsty.dj,cw_khjsty.yjwk,cw_khjsty.yhje,cw_khjsty.fqbl,cw_khjsty.fqje,cw_khjsty.djfxje,cw_khjsty.dyq,cw_khjsty.yhze,cw_khjsty.shfqje,cw_khjsty.yjzck,cw_khjsty.zcddjezq,cw_khjsty.zcddyh,cw_khjsty.dgzcjezq,cw_khjsty.dgzcyh,cw_khjsty.zcjsje,cw_khjsty.pck,cw_khjsty.khbjk,cw_khjsty.lrr,cw_khjsty.lrsj,dwmc,cw_khjsty.bz  ";
	ls_sql+=" FROM crm_khxx,cw_khjsty,sq_dwxx  ";
    ls_sql+=" where cw_khjsty.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and cw_khjsty.lrbm=sq_dwxx.dwbh(+)";
    ls_sql+=" and cw_khjsty.lx='1'";
    ls_sql+=" and cw_khjsty.clzt='1'";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_khjsty.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_khjstySpList.jsp","","","ShCw_khjsty.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"khbh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("���");
//���ð�ť����
	String[] buttonName={"����ͬ��"};//��ť����ʾ����
	String[] buttonLink={"SavePlCw_khjsty.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/cwgl/jrkhjs/ViewGxhCw_khjsty.jsp";//Ϊ�в�����coluParm.link���ó�������
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
	<td  width="2%">������</td>
	<td  width="2%">����ʱ��</td>
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