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

	String khxm=null;
	String fwdz=null;
	String lxfs=null;
	String khbh=null;
	String hth=null;
	String zjxm=null;
	String sgd=null;
	
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (cw_zjjsjl.fgsbh='"+fgs+"')";

	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (cw_zjjsjl.zjxm='"+zjxm+"')";
	}

	String zjlx=null;
	zjlx=request.getParameter("zjlx");
	if (zjlx!=null)
	{
		zjlx=cf.GB2Uni(zjlx);
		if (!(zjlx.equals("")))	wheresql+=" and  (cw_zjjsjl.zjlx='"+zjlx+"')";
	}
	
	
	String cw_zjjsjl_jsjlh=null;
	String cw_zjjsjl_lrr=null;
	String cw_zjjsjl_lrsj=null;
	String cw_zjjsjl_spbz=null;
	
	
	cw_zjjsjl_jsjlh=request.getParameter("cw_zjjsjl_jsjlh");
	if (cw_zjjsjl_jsjlh!=null)
	{
		cw_zjjsjl_jsjlh=cf.GB2Uni(cw_zjjsjl_jsjlh);
		if (!(cw_zjjsjl_jsjlh.equals("")))	wheresql+=" and  (cw_zjjsjl.jsjlh='"+cw_zjjsjl_jsjlh+"')";
	}
	
	cw_zjjsjl_lrr=request.getParameter("cw_zjjsjl_lrr");
	if (cw_zjjsjl_lrr!=null)
	{
		cw_zjjsjl_lrr=cf.GB2Uni(cw_zjjsjl_lrr);
		if (!(cw_zjjsjl_lrr.equals("")))	wheresql+=" and  (cw_zjjsjl.lrr='"+cw_zjjsjl_lrr+"')";
	}
	cw_zjjsjl_lrsj=request.getParameter("cw_zjjsjl_lrsj");
	if (cw_zjjsjl_lrsj!=null)
	{
		cw_zjjsjl_lrsj=cw_zjjsjl_lrsj.trim();
		if (!(cw_zjjsjl_lrsj.equals("")))	wheresql+="  and (cw_zjjsjl.lrsj>=TO_DATE('"+cw_zjjsjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_zjjsjl_lrsj=request.getParameter("cw_zjjsjl_lrsj2");
	if (cw_zjjsjl_lrsj!=null)
	{
		cw_zjjsjl_lrsj=cw_zjjsjl_lrsj.trim();
		if (!(cw_zjjsjl_lrsj.equals("")))	wheresql+="  and (cw_zjjsjl.lrsj<=TO_DATE('"+cw_zjjsjl_lrsj+"','YYYY/MM/DD'))";
	}
	cw_zjjsjl_spbz=request.getParameter("cw_zjjsjl_spbz");
	if (cw_zjjsjl_spbz!=null)
	{
		cw_zjjsjl_spbz=cf.GB2Uni(cw_zjjsjl_spbz);
		if (!(cw_zjjsjl_spbz.equals("")))	wheresql+=" and  (cw_zjjsjl.spbz='"+cw_zjjsjl_spbz+"')";
	}
	
	ls_sql="SELECT cw_zjjsjl.jsjlh,DECODE(cw_zjjsjl.spbz,'1','��ʼ����','2','�������','3','����ͨ��','4','����δͨ��'),b.dwmc fgsbh,zjxm,DECODE(cw_zjjsjl.zjlx,'1','���μ���','2','����'),cw_zjjsjl.sjfw,cw_zjjsjl.sjfw2,cw_zjjsjl.tcze,cw_zjjsjl.lrr,cw_zjjsjl.lrsj,a.dwmc lrbm,cw_zjjsjl.bz  ";
	ls_sql+=" FROM cw_zjjsjl,sq_dwxx a,sq_dwxx b";
    ls_sql+=" where cw_zjjsjl.lrbm=a.dwbh and cw_zjjsjl.fgsbh=b.dwbh";
    ls_sql+=" and cw_zjjsjl.spbz in('1','2')";
    ls_sql+=wheresql;
    ls_sql+=" order by cw_zjjsjl.jsjlh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Cw_zjjsjlList.jsp","SelectCw_zjjsjl.jsp","","EditCw_zjjsjl.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"jsjlh","cw_zjjsjl_dwbh","cw_zjjsjl_ywybh","cw_zjjsjl_sjfw2","cw_zjjsjl_dyqdze","cw_zjjsjl_dyqds","cw_zjjsjl_ywytcbl","cw_zjjsjl_ywyjsbl","cw_zjjsjl_dyjss","cw_zjjsjl_jzssk","cw_zjjsjl_wgjsje","cw_zjjsjl_kqtk","cw_zjjsjl_qdsyjsje","cw_zjjsjl_sjf","cw_zjjsjl_sjfksbl","cw_zjjsjl_sjftcbl","cw_zjjsjl_dyjsze","cw_zjjsjl_lrr","cw_zjjsjl_lrsj","sq_dwxx_dwmc","cw_zjjsjl_spbz","cw_zjjsjl_spyj","cw_zjjsjl_spr","cw_zjjsjl_spsj","cw_zjjsjl_bz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"jsjlh"};
	pageObj.setKey(keyName);
	pageObj.setEditBolt("");
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteCw_zjjsjl.jsp"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"jsjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewCw_zjjsjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("jsjlh",coluParm);//�в����������Hash��
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
  <B><font size="3">�ʼ����---�޸�</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(150);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="5%">&nbsp;</td>
	<td  width="6%">�����¼��</td>
	<td  width="6%">����״̬</td>
	<td  width="10%">�ֹ�˾</td>
	<td  width="5%">�ʼ�</td>
	<td  width="5%">����</td>
	<td  width="7%">ʱ�䷶Χ��</td>
	<td  width="7%">ʱ�䷶Χ��</td>
	<td  width="8%">����ܶ�</td>
	<td  width="5%">¼����</td>
	<td  width="7%">¼��ʱ��</td>
	<td  width="10%">¼�벿��</td>
	<td  width="19%">��ע</td>
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