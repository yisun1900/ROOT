<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010202")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String sq_yhxx_yhdlm=null;
	String sq_yhxx_yhmc=null;
	String sq_yhxx_yhkl=null;
	String sq_yhxx_yhjs=null;
	String dwbh=null;

	String txfs=request.getParameter("txfs");
	if (txfs!=null)
	{
		txfs=cf.GB2Uni(txfs);
		if (!(txfs.equals("")))	wheresql+=" and  sq_yhxx.txfs='"+txfs+"'";
	}

	String txjg=request.getParameter("txjg1");
	if (txjg!=null)
	{
		txjg=cf.GB2Uni(txjg);
		if (!(txjg.equals("")))	wheresql+=" and  sq_yhxx.txjg>="+txjg;
	}
	txjg=request.getParameter("txjg2");
	if (txjg!=null)
	{
		txjg=cf.GB2Uni(txjg);
		if (!(txjg.equals("")))	wheresql+=" and  sq_yhxx.txjg<="+txjg;
	}

	String ckjgbz=null;
	String zwbm=null;
	String zdyhbz=null;

	String kfgssq=request.getParameter("kfgssq");
	if (kfgssq!=null)
	{
		kfgssq=cf.GB2Uni(kfgssq);
		if (!(kfgssq.equals("")))	wheresql+=" and  (sq_yhxx.kfgssq='"+kfgssq+"')";
	}


	String kkglfx=request.getParameter("kkglfx");
	if (kkglfx!=null)
	{
		kkglfx=cf.GB2Uni(kkglfx);
		if (!(kkglfx.equals("")))	wheresql+=" and  (sq_yhxx.kkglfx='"+kkglfx+"')";
	}

	String khdhbz=request.getParameter("khdhbz");
	if (khdhbz!=null)
	{
		khdhbz=cf.GB2Uni(khdhbz);
		if (!(khdhbz.equals("")))	wheresql+=" and  (sq_yhxx.khdhbz='"+khdhbz+"')";
	}

	String sjxzbz=request.getParameter("sjxzbz");
	if (sjxzbz!=null)
	{
		sjxzbz=cf.GB2Uni(sjxzbz);
		if (!(sjxzbz.equals("")))	wheresql+=" and  (sq_yhxx.sjxzbz='"+sjxzbz+"')";
	}

	String sbsj=request.getParameter("sbsj");
	if (sbsj!=null)
	{
		sbsj=cf.GB2Uni(sbsj);
		if (!(sbsj.equals("")))	wheresql+=" and  (sq_yhxx.sbsj='"+sbsj+"')";
	}

	String xbsj=request.getParameter("xbsj");
	if (xbsj!=null)
	{
		xbsj=cf.GB2Uni(xbsj);
		if (!(xbsj.equals("")))	wheresql+=" and  (sq_yhxx.xbsj='"+xbsj+"')";
	}

	String ipxzbz=request.getParameter("ipxzbz");
	if (ipxzbz!=null)
	{
		ipxzbz=cf.GB2Uni(ipxzbz);
		if (!(ipxzbz.equals("")))	wheresql+=" and  (sq_yhxx.ipxzbz='"+ipxzbz+"')";
	}

	String ipdz=request.getParameter("ipdz");
	if (ipdz!=null)
	{
		ipdz=cf.GB2Uni(ipdz);
		if (!(ipdz.equals("")))	wheresql+=" and  (sq_yhxx.ipdz like '%"+ipdz+"%')";
	}

	String wkxzbz=request.getParameter("wkxzbz");
	if (wkxzbz!=null)
	{
		wkxzbz=cf.GB2Uni(wkxzbz);
		if (!(wkxzbz.equals("")))	wheresql+=" and  (sq_yhxx.wkxzbz='"+wkxzbz+"')";
	}

	String wkdz=request.getParameter("wkdz");
	if (wkdz!=null)
	{
		wkdz=cf.GB2Uni(wkdz);
		if (!(wkdz.equals("")))	wheresql+=" and  (sq_yhxx.wkdz like '%"+wkdz+"%')";
	}

	String[] bjjbbm=request.getParameterValues("bjjbbm");
	if (bjjbbm!=null)
	{
		String bjjb="";
		for (int i=0;i<bjjbbm.length ;i++ )
		{
			String bjjbmc=null;

			if (bjjbbm[i].equals(""))
			{
				continue;
			}
			
			bjjbmc=cf.executeQuery("select bjjbmc from  bdm_bjjbbm where bjjbbm='"+bjjbbm[i]+"'");
			bjjb+="��"+bjjbmc;
		}
		if (!bjjb.equals(""))
		{
			bjjb=bjjb.substring(1);
			wheresql+=" and  (sq_yhxx.bjjb='"+bjjb+"')";
		}
	}

	String[] bjjbbm1=request.getParameterValues("bjjbbm1");
	if (bjjbbm1!=null)
	{
		wheresql+=" and  (sq_yhxx.ygbh in(select ygbh from sq_sjsbjjb where "+cf.arrayToInSQL(bjjbbm1,"sq_sjsbjjb.bjjbbm")+"))";
	}

	String xzzwbm=null;
	xzzwbm=request.getParameter("xzzwbm");
	if (xzzwbm!=null)
	{
		xzzwbm=cf.GB2Uni(xzzwbm);
		if (!(xzzwbm.equals("")))	wheresql+=" and  (sq_yhxx.xzzwbm='"+xzzwbm+"')";
	}

	String kkbbz=null;
	kkbbz=request.getParameter("kkbbz");
	if (kkbbz!=null)
	{
		if (kkbbz.equals("Y"))
		{
			wheresql+=" and  (sq_yhxx.kkbbz='"+kkbbz+"')";
		}
		else{
			wheresql+=" and  (sq_yhxx.kkbbz='"+kkbbz+"' OR sq_yhxx.kkbbz is null)";
		}
	}
	
	
	String yhzbh=null;
	yhzbh=request.getParameter("yhzbh");
	if (yhzbh!=null)
	{
		if (!(yhzbh.equals("")))	wheresql+=" and  (sq_yhxx.yhdlm in(select yhdlm from sq_yhssz where yhzbh='"+yhzbh+"'))";
	}

	String sfsq=null;
	sfsq=request.getParameter("sfsq");
	if (sfsq!=null)
	{
		if (sfsq.equals("Y"))
		{
			wheresql+=" and  (sq_yhxx.yhdlm in(select yhdlm from sq_yhssz))";
		}
		else if (sfsq.equals("N"))
		{
			wheresql+=" and  (sq_yhxx.yhdlm not in(select yhdlm from sq_yhssz) or sq_yhxx.yhdlm is null)";
		}
	}
	
	String ygbh=null;
	ygbh=request.getParameter("ygbh");
	if (ygbh!=null)
	{
		if (!(ygbh.equals("")))	wheresql+=" and  (sq_yhxx.ygbh='"+ygbh+"')";
	}
	String bianhao=null;
	bianhao=request.getParameter("bianhao");
	if (bianhao!=null)
	{
		bianhao=cf.GB2Uni(bianhao);
		if (!(bianhao.equals("")))	wheresql+=" and  (sq_yhxx.bianhao='"+bianhao+"')";
	}

	String lrsj=null;
	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (sq_yhxx.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (sq_yhxx.lrsj<=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	
	
	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (!(ssfgs.equals("")))	wheresql+=" and  (sq_yhxx.ssfgs='"+ssfgs+"')";

	String kdlxtbz=null;
	kdlxtbz=request.getParameter("kdlxtbz");
	if (kdlxtbz!=null)
	{
		if (!(kdlxtbz.equals("")))	wheresql+=" and  (sq_yhxx.kdlxtbz='"+kdlxtbz+"')";
	}
	String sjsbh=null;
	sjsbh=request.getParameter("sjsbh");
	if (sjsbh!=null)
	{
		if (!(sjsbh.equals("")))	wheresql+=" and  (sq_yhxx.sjsbh='"+sjsbh+"')";
	}
	zdyhbz=request.getParameter("zdyhbz");
	if (zdyhbz!=null)
	{
		if (!(zdyhbz.equals("")))	wheresql+=" and  (sq_yhxx.zdyhbz='"+zdyhbz+"')";
	}
	ckjgbz=request.getParameter("ckjgbz");
	if (ckjgbz!=null)
	{
		if (!(ckjgbz.equals("")))	wheresql+=" and  (sq_yhxx.ckjgbz='"+ckjgbz+"')";
	}
	zwbm=request.getParameter("zwbm");
	if (zwbm!=null)
	{
		if (!(zwbm.equals("")))	wheresql+=" and  (sq_yhxx.zwbm='"+zwbm+"')";
	}

	sq_yhxx_yhdlm=request.getParameter("sq_yhxx_yhdlm");
	if (sq_yhxx_yhdlm!=null)
	{
		sq_yhxx_yhdlm=cf.GB2Uni(sq_yhxx_yhdlm);
		if (!(sq_yhxx_yhdlm.equals("")))	wheresql+=" and  (sq_yhxx.yhdlm='"+sq_yhxx_yhdlm+"')";
	}
	sq_yhxx_yhmc=request.getParameter("sq_yhxx_yhmc");
	if (sq_yhxx_yhmc!=null)
	{
		sq_yhxx_yhmc=cf.GB2Uni(sq_yhxx_yhmc);
		if (!(sq_yhxx_yhmc.equals("")))	wheresql+=" and  (sq_yhxx.yhmc like '%"+sq_yhxx_yhmc+"%')";
	}
	sq_yhxx_yhkl=request.getParameter("sq_yhxx_yhkl");
	if (sq_yhxx_yhkl!=null)
	{
		sq_yhxx_yhkl=cf.GB2Uni(sq_yhxx_yhkl);
		if (!(sq_yhxx_yhkl.equals("")))	wheresql+=" and  (sq_yhxx.yhkl='"+sq_yhxx_yhkl+"')";
	}
	sq_yhxx_yhjs=request.getParameter("sq_yhxx_yhjs");
	if (sq_yhxx_yhjs!=null)
	{
		sq_yhxx_yhjs=cf.GB2Uni(sq_yhxx_yhjs);
		if (!(sq_yhxx_yhjs.equals("")))	wheresql+=" and  (sq_yhxx.yhjs='"+sq_yhxx_yhjs+"')";
	}
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		dwbh=cf.GB2Uni(dwbh);
		if (!(dwbh.equals("")))	wheresql+=" and  (sq_yhxx.dwbh='"+dwbh+"')";
	}

	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));
	String jgpx2=cf.GB2Uni(request.getParameter("jgpx2"));
	String jgpx3=cf.GB2Uni(request.getParameter("jgpx3"));
	String jgpx4=cf.GB2Uni(request.getParameter("jgpx4"));
	String jgpx5=cf.GB2Uni(request.getParameter("jgpx5"));
	String jgpx6=cf.GB2Uni(request.getParameter("jgpx6"));
	String ordersql=" order by sq_yhxx.ssfgs,"+jgpx1;
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

	ls_sql="SELECT b.dwmc ssfgs,a.dwmc||'��'||a.dwbh||'��' as ssdw,DECODE(sq_yhxx.yhjs,'A0','�ܲ�','A1','�ܲ�����','F0','�ֹ�˾','F1','�ֹ�˾����','F2','����','F3','���С��','F4','�г�С��','F5','����С��') as sq_yhxx_yhjs,xzzwbm,zwmc,sq_yhxx.ygbh,sq_yhxx.yhmc as sq_yhxx_yhmc,'�޸�' xg,'��Ȩ' sq,DECODE(sq_yhxx.kfgssq,'0','����Ȩ','1','��Ȩ�����ֹ�˾','2','��Ȩ����ֹ�˾','3','��Ȩ��������','4','��Ȩĳһ�ֹ�˾�������','5','��Ȩ����ֹ�˾�������') as kfgssq,sq_yhxx.yhdlm,sq_yhxx.yhkl,DECODE(kdlxtbz,'Y','����','N','���ɵ�½') kdlxtbz,yxdlsbcs||'��' yxdlsbcs,lxdlsbcs,mmsyzq||'��' mmsyzq,mmxgsj,bsxtsmmzq||'��' bsxtsmmzq,sccgdlsj,yhzmc,DECODE(ckjgbz,'Y','�ɿ�','N','') ckjgbz,DECODE(zdyhbz,'Y','��','N','') zdyhbz,DECODE(kkbbz,'Y','��','N','') kkbbz,bjjb,DECODE(sjxzbz,'Y','����','N','������') sjxzbz,sbsj,xbsj,DECODE(ipxzbz,'Y','����','N','������') ipxzbz,ipdz,DECODE(wkxzbz,'Y','����','N','������') wkxzbz,wkdz,DECODE(sq_yhxx.khdhbz,'N','��','Y','�ɿ�') khdhbz,DECODE(sq_yhxx.kkglfx,'N','��','Y','�ɿ�') kkglfx,DECODE(sq_yhxx.txfs,'1','ϵͳ','2','�绰','3','����','4','����','9','ȫ��') txfs,sq_yhxx.txjg";
	ls_sql+=" FROM sq_yhxx,sq_dwxx a,sq_dwxx b,dm_zwbm,sq_yhssz,sq_yhz";
    ls_sql+=" where sq_yhxx.dwbh=a.dwbh(+) and sq_yhxx.ssfgs=b.dwbh(+) and sq_yhxx.zwbm=dm_zwbm.zwbm(+)";
	ls_sql+=" and sq_yhxx.yhdlm=sq_yhssz.yhdlm(+) and sq_yhssz.yhzbh =sq_yhz.yhzbh(+) and sq_yhxx.sfzszg in('Y','N')";
	ls_sql+=" and ((sq_yhxx.yhdlm is null) OR (sq_yhxx.yhdlm not in(select yhdlm from sq_yhssz where yhzbh='000000')))";
	
	ls_sql+=wheresql;
    ls_sql+=ordersql+",sq_yhxx.yhdlm";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Sq_yhxxList.jsp","","","");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");
/*
//������ʾ��
	String[] disColName={"yhdlm","sq_yhxx_yhmc","sq_yhxx_yhkl","sq_yhxx_yhjs","sq_dwxx_dwmc","sq_yhxx_dh","sq_yhxx_email"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ygbh"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ygbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewSq_yhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sq_yhxx_yhmc",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"ygbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="EditSq_yhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("xg",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey2={"yhdlm"};//�����в�����coluParm.key������
	coluParm.key=coluKey2;//�����в�����coluParm.key������
	coluParm.link="/xtsq/xtsq/grouptouser.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sq",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

//sq_yhxx_yhjs,ssdw,zwmc,ckjgbz,zdyhbz,kdlxtbz,bjjb,sq_yhxx_dh
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("ssfgs","1");//�в����������Hash��
	spanColHash.put("ssdw","1");//�в����������Hash��
	spanColHash.put("sq_yhxx_yhjs","1");//�в����������Hash��
	spanColHash.put("xzzwbm","1");//�в����������Hash��
	spanColHash.put("zwmc","1");//�в����������Hash��
	spanColHash.put("ygbh","1");//�в����������Hash��
	spanColHash.put("sq_yhxx_yhmc","1");//�в����������Hash��
	spanColHash.put("xg","1");//�в����������Hash��
	spanColHash.put("sq","1");//�в����������Hash��
	spanColHash.put("kfgssq","1");//�в����������Hash��
	spanColHash.put("yhdlm","1");//�в����������Hash��
	spanColHash.put("yhkl","1");//�в����������Hash��
	spanColHash.put("ckjgbz","1");//�в����������Hash��
	spanColHash.put("zdyhbz","1");//�в����������Hash��
	spanColHash.put("kkbbz","1");//�в����������Hash��
	spanColHash.put("kdlxtbz","1");//�в����������Hash��
	spanColHash.put("yxdlsbcs","1");//�в����������Hash��
	spanColHash.put("lxdlsbcs","1");//�в����������Hash��
	spanColHash.put("mmsyzq","1");//�в����������Hash��
	spanColHash.put("mmxgsj","1");//�в����������Hash��
	spanColHash.put("bsxtsmmzq","1");//�в����������Hash��
	spanColHash.put("sccgdlsj","1");//�в����������Hash��
	spanColHash.put("bjjb","1");//�в����������Hash��
	spanColHash.put("sq_yhxx_dh","1");//�в����������Hash��
	spanColHash.put("sjxzbz","1");//�в����������Hash��
	spanColHash.put("sbsj","1");//�в����������Hash��
	spanColHash.put("xbsj","1");//�в����������Hash��
	spanColHash.put("ipxzbz","1");//�в����������Hash��
	spanColHash.put("ipdz","1");//�в����������Hash��
	spanColHash.put("wkxzbz","1");//�в����������Hash��
	spanColHash.put("wkdz","1");//�в����������Hash��
	spanColHash.put("khdhbz","1");
	spanColHash.put("kkglfx","1");
	spanColHash.put("txfs","1");
	spanColHash.put("txjg","1");
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
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
  <B><font size="3">�û���Ȩ(����ְ��Ա��������ʾ)</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(360);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="100px">�ֹ�˾</td>
	<td  width="120px">��������</td>
	<td  width="70px">��ɫ</td>
	<td  width="120px">ְ��</td>
	<td  width="70px">����</td>
	<td  width="60px">Ա�����</td>
	<td  width="80px">Ա������</td>
	<td  width="40px">�޸�</td>
	<td  width="40px">��Ȩ</td>
	<td  width="140px">�ͻ�������Ȩ��Χ</td>
	<td  width="90px">�û���½��</td>
	<td  width="110px">����</td>
	<td  width="60px">�ɵ�½ϵͳ</td>
	<td  width="60px">�����½ʧ�ܴ���</td>
	<td  width="40px">ʧ�ܴ���</td>
	<td  width="60px">����ʹ������</td>
	<td  width="130px">�����޸�ʱ��</td>
	<td  width="60px">����ϵͳ����������</td>
	<td  width="130px">�ϴγɹ���½ʱ��</td>
	<td  width="130px">������</td>
	<td  width="50px">����鿴�۸���ϸ</td>
	<td  width="40px">�ص��û�</td>
	<td  width="40px">�ɿ���</td>
	<td  width="250px">���ۼ���</td>
	<td  width="40px">ʱ�����Ʊ�־</td>
	<td  width="50px">�ϰ�ʱ��</td>
	<td  width="50px">�°�ʱ��</td>
	<td  width="50px">IP��ַ���Ʊ�־</td>
	<td  width="100px">IP��ַ</td>
	<td  width="50px">������ַ���Ʊ�־</td>
	<td  width="110px">������ַ</td>
	<td  width="40px">�鿴�ͻ��绰</td>
	<td  width="40px">�ɿ����Ϸ���</td>
	<td  width="40px">���ѷ�ʽ</td>
	<td  width="40px">���Ѽ��</td>
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