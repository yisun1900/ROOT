<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String psph=null;
	String psdzt=null;
	String psfs=null;
	String lrr=null;
	String lrrq=null;
	String jhshsj=null;
	psph=request.getParameter("psph");
	if (psph!=null)
	{
		psph=cf.GB2Uni(psph);
		if (!(psph.equals("")))	wheresql+=" and  (jxc_clpsd.psph='"+psph+"')";
	}
	psdzt=request.getParameter("psdzt");
	if (psdzt!=null)
	{
		psdzt=cf.GB2Uni(psdzt);
		if (!(psdzt.equals("")))	wheresql+=" and  (jxc_clpsd.psdzt='"+psdzt+"')";
	}
	psfs=request.getParameter("psfs");
	if (psfs!=null)
	{
		psfs=cf.GB2Uni(psfs);
		if (!(psfs.equals("")))	wheresql+=" and  (jxc_clpsd.psfs='"+psfs+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (jxc_clpsd.lrr='"+lrr+"')";
	}
	lrrq=request.getParameter("lrrq");
	if (lrrq!=null)
	{
		lrrq=lrrq.trim();
		if (!(lrrq.equals("")))	wheresql+="  and (jxc_clpsd.lrrq>=TO_DATE('"+lrrq+"','YYYY/MM/DD'))";
	}
	lrrq=request.getParameter("lrrq2");
	if (lrrq!=null)
	{
		lrrq=lrrq.trim();
		if (!(lrrq.equals("")))	wheresql+="  and (jxc_clpsd.lrrq<=TO_DATE('"+lrrq+"','YYYY/MM/DD'))";
	}
	jhshsj=request.getParameter("jhshsj");
	if (jhshsj!=null)
	{
		jhshsj=jhshsj.trim();
		if (!(jhshsj.equals("")))	wheresql+="  and (jxc_clpsd.jhshsj>=TO_DATE('"+jhshsj+"','YYYY/MM/DD'))";
	}
	jhshsj=request.getParameter("jhshsj2");
	if (jhshsj!=null)
	{
		jhshsj=jhshsj.trim();
		if (!(jhshsj.equals("")))	wheresql+="  and (jxc_clpsd.jhshsj<=TO_DATE('"+jhshsj+"','YYYY/MM/DD'))";
	}

	ls_sql="SELECT jxc_clpsd.psph,DECODE(jxc_clpsd.psdzt,'0','�ȴ��ύ','2','�ȴ�����','3','�ѳ���','5','���ֳ���') psdzt,DECODE(jxc_clpsd.psfs,'1','����','2','����','9','����') psfs,jxc_clpsd.jhshsj,jxc_clpsd.khbh,crm_khxx.hth,crm_khxx.khxm,sq_sgd.sgdmc,crm_khxx.fwdz,jxc_clpsd.pszsl,jxc_clpsd.pszje,jxc_clpsd.yf,jxc_clpsd.qtsf,jxc_clpsd.fkje,jxc_clpsd.lrr,jxc_clpsd.lrrq,a.dwmc ssfgs,b.dwmc ssbm,jxc_clpsd.bz  ";
	ls_sql+=" FROM jxc_clpsd,crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd  ";
    ls_sql+=" where jxc_clpsd.khbh=crm_khxx.khbh(+) ";
    ls_sql+=" and crm_khxx.fgsbh=a.dwbh and crm_khxx.dwbh=b.dwbh   ";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and jxc_clpsd.psdzt in ('0','2')";

	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by jxc_clpsd.lrrq desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Jxc_clpsdList.jsp","","","EditJxc_clpsd.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"psph"};
	pageObj.setKey(keyName);

//���ð�ť����
	String[] buttonName={"ɾ�����͵�","ɾ���ύ"};//��ť����ʾ����
	String[] buttonLink={"DeleteJxc_clpsd.jsp","sctj.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1,1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"psph"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewJxc_clpsd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("psph",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp?";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khbh",coluParm);//�в����������Hash��
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
  <B><font size="3">���͵�ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(250);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="5%">��������</td>
	<td  width="4%">���͵�״̬</td>
	<td  width="3%">���ͷ�ʽ</td>
	<td  width="4%">�ƻ��ͻ�ʱ��</td>
	<td  width="3%">�ͻ����</td>
	<td  width="4%">��ͬ��</td>
	<td  width="4%">�ͻ�����</td>
	<td  width="3%">ʩ����</td>
	<td  width="11%">���ݵ�ַ</td>
	<td  width="4%">����������</td>
	<td  width="5%">�����ܽ��</td>
	<td  width="4%">�����˷�</td>
	<td  width="4%">�����շ�</td>
	<td  width="4%">������</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼������</td>
	<td  width="5%">�����ֹ�˾</td>
	<td  width="7%">����</td>
	<td  width="16%">��ע</td>
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